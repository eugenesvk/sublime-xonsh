# 🐚xonsh

Thank you for installing __xonsh__!
(switch to Markdown via Command Palette's `Set Syntax: Markdown` for better reading experience and upvote this Package Control package's [issue](https://github.com/wbond/package_control/issues/238) to make Markdown rendering the default)

This package adds support for the Python-powered shell [xonsh](https://xon.sh) (for files with `.xsh` and `.xonshrc` extensions) by extending the syntax definitions from the default Python package with the following xonsh-specific contexts:

- Variables            : `$variableA`, including the environment `${...}`
- Subprocess operators : `$()` `$[]` `${}` `@()` `@$()` (and `!()` `![]`)
- Search functions     : `` @functionB`search_string` ``
- Builtin functions    : `abbrevs()` `aliases()` `compilex()` `execx()` `evalx()` `events()` `print_color()` `exit()` `printx()`

... and copying all the other relevant elements (Snippets, Comments, Completion Rules, Indentation Rules, Symbol List, and the Default keymap) & re-scoping them to work in the `xonsh` syntax

To test it you can open any `xonsh` file, for example, [syntax_example_screen.xsh](https://github.com/eugenesvk/sublime-xonsh/blob/main/test/syntax_example_screen.xsh)[^1], and verify that the selected syntax is `Xonsh` and xonsh-specific contexts are properly scoped and highlighted, maybe like so (depending on your color scheme)[^2]:
![xonsh syntax screenshot solarized](https://user-images.githubusercontent.com/12956286/135798050-039e21a2-bd67-4397-8047-00306b4d0477.png?raw=true "Custom solarized scheme")
![xonsh syntax screenshot default](https://user-images.githubusercontent.com/12956286/135796149-0c918602-39cc-40d9-8d50-eaed8c6907f6.png?raw=true "Default color scheme")

A more detailed overview is available at the [GitHub package page](https://github.com/eugenesvk/sublime-xonsh), where you can also report 🐞bugs or provide any other feedback via [GitHub issues](https://github.com/eugenesvk/sublime-xonsh/issues)

[^1]: this example file is also included in this package locally, but you'd need to install [PackageResourceViewer](https://packagecontrol.io/packages/PackageResourceViewer) to conveniently extract it
[^2]: you can install the [Markdown Images](https://github.com/xsleonard/sublime-MarkdownImages) package to render images inside this file via Command Palette's `MarkdownImages: Show Remote Images`
