# multi-highlight.nvim

Highlight multiple word with different colors

<img src="" alt="screenshot" width="800"/>

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
require'shade'.setup()
```

### Custom colors and key-mapping
```
require'shade'.setup({
    -- you can add any number of colors you like
    groups = {'#AEEE00', '#aa2222', '#22aa22', '#2222aa', '#B08020', '#FFA020', '#22aa22', '#8888ff'},
    keys = {
        ['<Space>m'] = {cmd='<cmd>lua require("multi-highlight").toggle_highlight()<cr>'},
        ['<Space>M'] = {cmd='<cmd>lua require("multi-highlight").clear()<cr>'},
    }
})
```

## License

Copyright (c) Ary.Wzh. Distributed under the MIT license

