local colorizer = require 'colorizer'
colorizer.setup({
	'*';
	css = { css = true };
	scss = { css = true };
	less = { css = true };
	thml = { css = true };
}, { mode = 'background' })
