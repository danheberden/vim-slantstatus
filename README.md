# SlantStatus

A simple segmented statusline plugin for vim. 

![](http://danheberden.com/share/1ee70cb.png)

## Installation

Add `slantstatus.vim` to your `.vim/autoload` directory or use [pathogen](https://github.com/tpope/vim-pathogen)
to add the file (or whole folder - possibly as a git submodule) to your `.vim/bundle` directory.

You can use the [powerline fonts](https://github.com/Lokaltog/powerline-fonts) if you like that style.
I found it to stand out to much, hence the slanted style. You can find patched fonts in the `fonts`
directory to use in your terminal of choice (be sure to set both ascii and non-ascii fonts).

## Use

Creating a Segment is easy. In your `.vimrc` call `slantstatus#Segment( statuslinecommand, backgroundcolor, foregroundcolor)`.

For Example:

```
call slantstatus#Segment('\ %{mode()}\ ', 20, 253)       " mode
call slantstatus#Segment('%-3.3n', 244, 255)             " buffer number
call slantstatus#Segment('', 241, 18)
call slantstatus#Segment('\ %f', 237, 253)               " filename
call slantstatus#Segment('switch', 0, 0)                 " right-side
call slantstatus#Segment('', 239, 232)
call slantstatus#Segment('', 243, 232)
call slantstatus#Segment('', 246, 232)
call slantstatus#Segment('%14.(%l/%L,%c%V%)', 249, 232) " Line #, Total Line, Column
call slantstatus#Segment('%3p%%', 172, 229)              " % of file
```

## switch

```
call slantstatus#Segment('switch', 0, 0)
```

Will change to aligning items to the right of the status bar, as well as 
automatically change the symbol direction.

## License
Copyright (c) 2012 Dan Heberden Licensed under the MIT license.

