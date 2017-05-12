Vim Filetype Support for [goyacc][]
===================================

[vim-goyacc][] is a filetype support for [goyacc][].

It provides standard YACC syntax highlight
and Go syntax highlight inside semantic action `{...}`. Default YACC syntax highlight attempts
to highlight the semantic action as C or C++, though.

And this also provides Go's indentation using `runtime/indent/go.vim`. It provides more
pleasant auto indentation as editing Go source.

![screen shot][]

Note: Name of file for goyacc must end with `.go.y`.


## How to Install

If you use Vim's default package management, please refer `:help load-plugins`. Clone this
repository with `git` to proper location in your filesystem.

If you use your favorite Vim plugin manager like [vim-plug][], please follow the instruction
in its documentation.


## License

This plugin was derived from Vim's standard YACC filetype support. Hence this plugin is
provided with the same license as Vim (Vim license). Please see `:help license` in Vim for
more detail.

[goyacc]: https://godoc.org/golang.org/x/tools/cmd/goyacc
[vim-goyacc]: https://github.com/rhysd/vim-goyacc
[vim-plug]: https://github.com/junegunn/vim-plug
[screen shot]: https://github.com/rhysd/ss/blob/master/vim-goyacc/main.png?raw=true