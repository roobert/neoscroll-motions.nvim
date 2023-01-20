# neoscroll-motions

Neovim neoscroll extra motions support.

This is a work in progress, currently this adds support for `{}`.

Support is intended for: `nN` and `*#`.

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
