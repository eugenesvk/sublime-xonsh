# Changelog
All notable changes to this project will be documented in this file

[unreleased]: https://github.com/eugenesvk/sublime-xonsh/compare/4148_0.2.0...4148-
## [Unreleased]
  <!-- - __Added__ -->
  <!--   + :sparkles:  -->
  <!-- - __Changed__ -->
  <!--   +  -->
  <!-- - __Fixed__ -->
  <!--   + :lady_beetle:  -->
  <!-- - __Deprecated__ -->
  <!--   + :poop:  -->
  <!-- - __Removed__ -->
  <!--   + :wastebasket:  -->
  <!-- - __Security__ -->
  <!--   + :lock:  -->

  - __Fixed__
    + :lady_beetle: rename `inline-for` to match the new syntax `for-expressions`

[4148_0.2.0]: https://github.com/eugenesvk/sublime-xonsh/releases/tag/4148_0.2.0
## [4148_0.2.0]
  - __Changed__
    + syntax version to 2 since default syntax was updated in ST 4148

[0.1.2]: https://github.com/eugenesvk/sublime-xonsh/releases/tag/0.1.2
## [0.1.2]
  - __Fixed__
    + :lady_beetle: closing brackets highlighted as illegal stray braces in ST4 Dev

[0.1.1]: https://github.com/eugenesvk/sublime-xonsh/releases/tag/0.1.1
## [0.1.1]
  - __Fixed__
    + :lady_beetle: whitespace before `@()` `@$()` breaking a match

[0.1.0]: https://github.com/eugenesvk/sublime-xonsh/releases/tag/0.1.0
## [0.1.0]
  - __Added__
    + :sparkles: Variables: `$variableA`, including the environment `${...}`
    + :sparkles: Subprocess operators: `$()` `$[]` `${}` `@()` `@$()` (and `!()` `![]`)
    + :sparkles: Search functions: `` @functionB`search_string` ``
    + :sparkles: Builtin functions: `abbrevs()` `aliases()` `compilex()` `execx()` `evalx()` `events()` `print_color()` `exit()` `printx()`
