# multi-highlight.nvim

Highlight multiple words with different colors writen in Lua

![screenshot](https://github.com/arywz/multi-highlight.nvim/blob/master/img/shot.png)

## Installation

### [Packer](https://github.com/wbthomason/packer.nvim) 

```
use 'arywz/multi-highlight.nvim'
```
### [Vim-Plug](https://github.com/junegunn/vim-plug)

```
Plug 'arywz/multi-highlight.nvim'
```

## Configuration

### Use Default
```
require'multi-highlight'.setup()
```

### Custom colors and key-mapping
```
require'multi-highlight'.setup({
    -- you can add any number of colors you like
    groups = {'#AEEE00', '#aa2222', '#22aa22', '#2222aa', '#B08020', '#FFA020', '#22aa22', '#8888ff'},
    keys = {
        ['<Space>m'] = {cmd='<cmd>lua require("multi-highlight").toggle_highlight()<cr>'},
        ['<Space>M'] = {cmd='<cmd>lua require("multi-highlight").clear()<cr>'},
    }
})
```

## License

MIT license

## Special Thanks

[https://github.com/lfv89/vim-interestingwords](https://github.com/lfv89/vim-interestingwords) -- inspiration
