local GIT_COMMIT_PROMPT = [[
Given the following git diff, generate a commit message following Tim Pope’s Guidelines:
- The first line should be a short, imperative summary (max 60 characters).
- If the change is complex, add a blank line and a detailed explanation.
- Use bullet points for multiple detailed explanations.
- Do not include issue numbers or references.
- Avoid using the word refactor, instead explain what was done.
- Ignore nested bullets.
- Wrap the whole message in code block with language gitcommit.

#gitdiff:staged
]]

local GIT_COMMIT_PROMPT_WITH_ISSUE_KEY = [[
Given the following prefix and code diff, write a commit message in the conventional commit format:

Prefix: %s

Code diff:
#gitdiff:staged

Instructions:
- Use the format: `%s: <short summary>`
- The first line should be a short, imperative summary (max 60 characters).
- If the change is complex, add a blank line and a detailed explanation.
- Use bullet points for multiple detailed explanations.
- Avoid using the word refactor, instead explain what was done.
- Ignore nested bullets.
- Wrap the whole message in code block with language gitcommit.
]]

local GIT_DAILY_SUMMARY_PROMPT = [[
Create a changelog by summarizing the following git commit messages in concise bullet points, merging similar topics into a single bullet point.

- Ignore any git merge commit messages.
- Ignore any revert commit messages.
- Only capture an issue key if it appears at the very beginning of a commit message, with the format "SETLINK-" followed by digits (e.g., "SETLINK-123"). Ignore any issue key mentioned elsewhere in the message.
- For any commit message starting with an issue key, include the issue key at the beginning of the bullet point (e.g., "- summary (SETLINK-123)").
- Merge similar topics together into one bullet point, summarizing them collectively.
- Each bullet point must not exceed 200 characters.
- Total output should not exceed 1000 characters.
- Output in simple plain text, no code blocks or markdown.

Example output format:

- Summary of related changes (SETLINK-123)
- Summary of other related changes (SETLINK-124)
- summary of another topic

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
  local cmd = "git log --all --no-merges --author="
    .. user
    .. " --pretty=format:'%s%b' --since='"
    .. since
    .. "' --until='"
    .. until_
    .. "'"

  local handle = io.popen(cmd)
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
