<p align="center">
A Sublime Text 4 package for the <a href="https://xon.sh">Python-powered shell <b>xonsh</b></a>
<br/>
extending the default <a href="https://github.com/sublimehq/Packages/tree/master/Python">Python package</a> with xonsh-specific contexts
</p>


## Introduction

This package adds support for the `xonsh` language (for files with `.xsh` and `.xonshrc` extensions) by extending the syntax definitions from the default Python package with the following xonsh-specific contexts:

- Variables: `$variableA`, including the environment `${...}`
- Subprocess operators: `$()` `$[]` `${}` `@()` `@$()` (and `!()` `![]`)
- Search functions: `` @functionB`search_string` ``
- Builtin functions: `abbrevs()` `aliases()` `compilex()` `execx()` `evalx()` `events()` `print_color()` `exit()` `printx()`

... and copying all the other relevant elements (Snippets, Comments, Completion Rules, Indentation Rules, Symbol List, and the Default keymap) & re-scoping them to work in the `xonsh` syntax

## Installation

- __Via [Package Control](https://packagecontrol.io)__: open `Command Palette` → `Package Control: Install Package` → `xonsh`<br>
                                          <kbd>^Ctrl</kbd>/<kbd>⌘Cmd</kbd><kbd>⇧Shift</kbd><kbd>P</kbd>

- __Manually__: clone this repository to your [Packages directory](https://www.sublimetext.com/docs/packages.html) and rename it to `xonsh`
```sh
cd /path/to/sublime/packages/directory
git clone https://github.com/eugenesvk/sublime-xonsh.git
mv sublime-xonsh xonsh
```

## Usage

Open any `xonsh` file (e.g. [syntax_example_screen.xsh](./test/syntax_example_screen.xsh)) and verify that the selected syntax is `Xonsh` and xonsh-specific contexts are properly scoped[^1] and highlighted, maybe like so (depending on your color scheme):

![xonsh syntax screenshot solarized](https://user-images.githubusercontent.com/12956286/135798050-039e21a2-bd67-4397-8047-00306b4d0477.png?raw=true "Custom solarized scheme")

![xonsh syntax screenshot default](https://user-images.githubusercontent.com/12956286/135796149-0c918602-39cc-40d9-8d50-eaed8c6907f6.png?raw=true "Default color scheme")

[^1]: scope naming is supposed to conform to that of the default Python package and [ST's scope naming guidelines](https://www.sublimetext.com/docs/scope_naming.html)

<details>
<summary>Examples of supported syntaxes: variables</summary>

  | Example        	| Description
  | :--------------	| :----------
  | `$`            	| Match a single variable definition symbol to help with completions
  | `$varA=[1,2]`  	| Regular variable
  | `$varA[0]`     	| Variable indexing
  | `$varA[$varB]` 	| Variable inside an index
  | `funct($varB)` 	| Variable inside a function
  | `f"{$varA}"`   	| Variable inside a function string
  | `${...}`       	| The environment itself

</details>

<details>
<summary>Examples of supported syntaxes: subprocess operators</summary>

| Example        	| Description
| :--------------	| :----------
| `@$(which ls)` 	| Command Substitution
| `@('echo', 1)` 	| Python Evaluation
| `$(echo 1)`    	| Captured Subprocess
| `!(echo 1)`    	| ...
| `$[echo 1]`    	| Uncaptured Subprocess
| `![echo 1]`    	| ...

</details>


### Exposed scopes
<details>
<summary>List of scope names</summary>

  | xonsh construct      	| Scope name
  | :------------        	| :----------
  | Variable             	| `meta.variable.xonsh` <br> `variable.other.xonsh` `variable.other.env.xonsh` `variable.other.env.ellipsis.xonsh` <br> `punctuation.definition.variable.xonsh` 
  | Command Substitution 	| `meta.interpolation.command.xonsh` `meta.parens.interpolation.command` <br> `keyword.operator.subprocess.pyeval.xonsh` `keyword.operator.subprocess.xonsh` <br> `punctuation.section.parens.` `begin`/`end` `.xonsh`
  | Python Evaluation    	| `meta.interpolation.command.xonsh` `meta.parens.interpolation.command` <br> `keyword.operator.subprocess.pyeval.xonsh` <br> `punctuation.section.parens.` `begin`/`end` `.xonsh`
  | Captured Subprocess  	| `meta.interpolation.command.xonsh` `meta.parens.interpolation.command` <br> `keyword.operator.subprocess.captured.xonsh` <br> `punctuation.section.parens.` `begin`/`end` `.xonsh`
  | Uncaptured Subprocess	| `meta.interpolation.command.xonsh` `meta.brackets.interpolation.command` <br> `keyword.operator.subprocess.uncaptured.xonsh` <br> `punctuation.section.brackets.` `begin`/`end` `.xonsh`
  | Search Function      	| `meta.function-call.xonsh` `meta.function-call.arguments.xonsh` `meta.string.xonsh` <br> `string.quoted.backtick.xonsh` <br> `punctuation.definition.annotation.xonsh` `punctuation.section.string.` `begin`/`end` `.xonsh` `punctuation.section.arguments.` `begin`/`end` `.xonsh`

</details>

### Keybindings

This plugin adds two keybindings for the `xonsh` scope: `"`/`'` that auto-pair double/single quotes even after string modifiers

## Known issues

- Only works in Sublime Text 4 since build __4075__ (10 July 2020) since it's using `meta_append`/`meta_prepend` APIs
- Illegal Python names that would be legal in a subprocess mode are nonetheless scoped as illegal since there is no differentiation between Python and subprocess modes:<br>
  e.g. `as` in `echo "$HOME" as well as '$HOME'`<br>
  As a workaround use `"`quotes`"` or dim/remove error highlighting for `source.xonsh invalid.illegal.name`

## Credits

The default packages' syntax files ([Python](https://github.com/sublimehq/Packages/blob/master/Python/Python.sublime-syntax), [Bash](https://github.com/sublimehq/Packages/blob/master/ShellScript/Bash.sublime-syntax), [PHP](https://github.com/sublimehq/Packages/blob/master/PHP/PHP.sublime-syntax)), as well as [fish](https://github.com/Phidica/sublime-fish/blob/master/fish.sublime-syntax) 
