# neoscroll-motions

Neovim neoscroll extra motions support.

This is a work in progress, currently this adds support for `{}`.

Support is intended for: `nN` and `*#`.

This is now archived in favor of https://github.com/echasnovski/mini.animate which appears to have better support for various movements.

## Usage

``` lua
{
  "roobert/neoscroll-motions.nvim",
  dependencies = "karb94/neoscroll.nvim"
  config = function()
    require("neoscroll-motions").setup()
  end,
},
```
