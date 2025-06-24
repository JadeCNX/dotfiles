local GIT_COMMIT_PROMPT = [[
Write expertly crafted concise commit message for the change with commitizen convention.
Start with a summary in imperative mood, explain the 'why' behind changes,
keep the summary under 50 characters, use bullet points for multiple changes,
avoid using the word refactor, instead explain what was done.
Wrap the whole message in code block with language gitcommit.
#git:staged
]]

local GIT_COMMIT_PROMPT_WITH_ISSUE_KEY = [[
Given the following prefix and code diff, write a commit message in the conventional commit format:

Prefix: %s

Code diff:
#git:staged

Instructions:
- Use the format: `%s: <short summary>`
- Start with a summary in imperative mood.
- Keep the summary under 60 characters.
- Add detailed summary in the body and use bullet points for multiple changes.
- Avoid using the word refactor, instead explain what was done.
- Wrap the whole message in code block with language gitcommit.
]]

local GIT_DAILY_SUMMARY_PROMPT = [[
Summarize the following git commit messages and diffs in concise bullet points.

- Ignore any git merge commit messages.
- Ignore any revert commit messages.
- Only capture an issue key if it appears at the very beginning of a commit message, with the format "SETLINK-" followed by digits (e.g., "SETLINK-123"). Ignore any issue key mentioned elsewhere in the message.
- For any commit message starting with an issue key, group all such commits under that issue key. Start the group with the issue key followed by a colon (e.g., "SETLINK-123:").
- For commits without an issue key at the beginning, group them under "General changes:".
- Only include the "General changes:" section if there are commits without an issue key at the beginning. If there are none, do not include this section at all. Do not output "General changes:" or any placeholder if there are no such commits.
- Do not invent or add any issue key if none exist at the beginning of the commit messages.
- For each group, list the summarized commit messages and their corresponding diffs as bullet points.
- Output in simple plain text, no code blocks or markdown.

Example output format:

SETLINK-123:
- Summary 1
- Summary 2

General changes:
- summary 1
- summary 2


Input git commit messages:

%s
]]

local function remove_code_blocks(text)
  return text:gsub("```%s*gitcommit(.-)%s*```", "%1"):gsub("'", "'\\''")
end

vim.api.nvim_create_user_command("Commit", function()
  vim.notify("Committing staged changes...\n", vim.log.levels.INFO)

  require("CopilotChat").ask(GIT_COMMIT_PROMPT, {
    callback = function(response)
      os.execute("git commit -m '" .. remove_code_blocks(response) .. "'")
      vim.cmd("qa!")
    end,
  })
end, { desc = "Generate commit message from staged change" })

vim.api.nvim_create_user_command("Recommit", function()
  vim.notify("Recommitting staged changes...\n", vim.log.levels.INFO)

  os.execute("git reset --soft HEAD~1")

  require("CopilotChat").ask(GIT_COMMIT_PROMPT, {
    callback = function(response)
      os.execute("git commit -m '" .. remove_code_blocks(response) .. "'")
      vim.cmd("qa!")
    end,
  })
end, { desc = "Recommit staged changes with generated commit message" })

vim.api.nvim_create_user_command("IssuedCommit", function(o)
  vim.notify("Committing staged changes with issue key: " .. o.args .. "\n", vim.log.levels.INFO)

  require("CopilotChat").ask(string.format(GIT_COMMIT_PROMPT_WITH_ISSUE_KEY, o.args, o.args), {
    callback = function(response)
      os.execute("git commit -m '" .. remove_code_blocks(response) .. "'")
      vim.cmd("qa!")
    end,
  })
end, { nargs = 1, desc = "Generate commit message with issue key from staged change" })

vim.api.nvim_create_user_command("IssuedRecommit", function(o)
  vim.notify("Recommitting staged changes with issue key: " .. o.args .. "\n", vim.log.levels.INFO)

  os.execute("git reset --soft HEAD~1")

  require("CopilotChat").ask(string.format(GIT_COMMIT_PROMPT_WITH_ISSUE_KEY, o.args, o.args), {
    callback = function(response)
      os.execute("git commit -m '" .. remove_code_blocks(response) .. "'")
      vim.cmd("qa!")
    end,
  })
end, { nargs = 1, desc = "Recommit staged changes with generated commit message and issue key" })

-- BufOnly
vim.api.nvim_command([[command! BufOnly execute ':bufdo! bd #']])

-- Restore persistence
vim.api.nvim_create_user_command("RestorePersistence", function()
  require("persistence").load()
end, {})

vim.api.nvim_create_user_command("DailySummarized", function(opts)
  local date_str = opts.args
  if not date_str:match("^%d%d%d%d%-%d%d%-%d%d$") then
    vim.cmd("qa!")
    return
  end

  local since = date_str .. " 00:00:00"
  local until_ = date_str .. " 23:59:59"

  local user = vim.env.USER or ""
  local handle = io.popen(
    "git log --all --patch --no-merges --author="
      .. user
      .. " --pretty=format:'%s%b'"
      .. " --since='"
      .. since
      .. "' --until='"
      .. until_
      .. "'"
  )
  if not handle then
    return
  end

  local content = handle:read("*a")
  handle:close()
  if content == "" then
    vim.cmd("qa!")
    return
  end

  require("CopilotChat").ask(string.format(GIT_DAILY_SUMMARY_PROMPT, content), {
    callback = function(response)
      vim.print(response)
      vim.cmd("qa!")
    end,
  })
end, { nargs = 1, complete = nil, desc = "Summarize git commits and diffs for a date" })
