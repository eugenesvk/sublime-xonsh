# SYNTAX TEST "Packages/xonsh/xonsh.sublime-syntax"

# 1 Test overall source match
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^ source.xonsh

# 2 Test xonsh builtin functions
abbrevs(); aliases(); compilex(); execx(); evalx(); events(); print_color(); exit(); printx()
# <-                                                                                        support.function.builtin.xonsh
#^^^^^^                                                                                     support.function.builtin.xonsh
#          ^^^^^^^                                                                          support.function.builtin.xonsh
#                     ^^^^^^^^                                                              support.function.builtin.xonsh
#                                 ^^^^^                                                     support.function.builtin.xonsh
#                                          ^^^^^                                            support.function.builtin.xonsh
#                                                   ^^^^^^                                  support.function.builtin.xonsh
#                                                             ^^^^^^^^^^^                   support.function.builtin.xonsh
#                                                                            ^^^^           support.function.builtin.xonsh
#                                                                                    ^^^^^^ support.function.builtin.xonsh

# 3 Test xonsh $variables
$             # 0 Match a single variable definition symbol to help with completions
# <-              meta.variable.xonsh
# <-              punctuation.definition.variable.xonsh
$varA[$]      #   ...including for item access
#     ^           meta.variable.xonsh
#     ^           punctuation.definition.variable.xonsh
funct($)      #   ...including for function calls
#     ^           meta.variable.xonsh
#     ^           punctuation.definition.variable.xonsh
$varA=[1,2]   # 1 Regular variable $var
# <-              punctuation.definition.variable.xonsh
# <-              meta.variable.xonsh
#^^^^             meta.variable.xonsh
# <-              variable.other.xonsh
#^^^^             variable.other.xonsh
$varB=0       #   test that the variable scope doesn't override the next one
#    ^            keyword.operator.assignment.python
$varA[0]      # 2 Variable indexing $var[0]
# <-              punctuation.definition.variable.xonsh
# <-              meta.variable.xonsh
#^^^^             meta.variable.xonsh
# <-              variable.other.xonsh
#^^^^             variable.other.xonsh
$varA[$varB]  # 3 Variable inside an index $var[$var]
# <-              punctuation.definition.variable.xonsh
# <-              meta.variable.xonsh
#^^^^             meta.variable.xonsh
# <-              variable.other.xonsh
#^^^^             variable.other.xonsh
#     ^           punctuation.definition.variable.xonsh
#     ^^^^^       meta.variable.xonsh
#     ^^^^^       variable.other.xonsh
funct($varB)  #   Variable inside a function fn($var)
#     ^           punctuation.definition.variable.xonsh
#     ^^^^^       meta.variable.xonsh
#     ^^^^^       variable.other.xonsh
f"{$varA}"    # 4 Function strings
#  ^              punctuation.definition.variable.xonsh
#  ^^^^^          meta.variable.xonsh
#  ^^^^^          variable.other.xonsh
${...}        # 5 The environment itself
# <-              punctuation.definition.variable.xonsh
# <-              meta.variable.xonsh
#^^^^^            meta.variable.xonsh
#^^^^^            variable.other.env.xonsh
# ^^^             variable.other.env.ellipsis.xonsh
'H' in ${...} #
#      ^          punctuation.definition.variable.xonsh
#      ^^^^^^     meta.variable.xonsh
#       ^^^^^     variable.other.env.xonsh
${'USER'}     #   ${<expr>} Environment Lookup
# <-              punctuation.definition.variable.xonsh
# <-              meta.variable.xonsh
#^^^^^^^          meta.variable.xonsh
#^^^^^^^          variable.other.env.xonsh
"not $varA $" # 6 Comment
#    ^            string.quoted.double
#     ^^^^        string.quoted.double

# 4 Test xonsh subprocess operators $() $[] ${} @() @$()
@$(which ls)  # 1 Command Substitution @$(<expr>)
# <-             keyword.operator.subprocess.pyeval.xonsh
#^               keyword.operator.subprocess.xonsh
# ^              punctuation.section.parens.begin.xonsh
#          ^     punctuation.section.parens.end.xonsh
# <-             meta.interpolation.command.xonsh
#^^^^^^^^^^^     meta.interpolation.command.xonsh
# ^^^^^^^^^^     meta.parens.interpolation.command
 @$(which ls) #  same starting with a space
#^               keyword.operator.subprocess.pyeval.xonsh
# ^              keyword.operator.subprocess.xonsh
#  ^             punctuation.section.parens.begin.xonsh
#           ^    punctuation.section.parens.end.xonsh
#^^^^^^^^^^^^    meta.interpolation.command.xonsh
#  ^^^^^^^^^^    meta.parens.interpolation.command
A @ B         #  test that we didn't break matrix multiplication
# ^              keyword.operator.matrix.python
@annotation   #  test that we didn't break function annotations
# <-             punctuation.definition.annotation.python
# <-             meta.annotation.python
#^^^^^^^^^^      meta.annotation.python
@$            #  don't scope ‘$’ as ‘invalid.illegal.character’
# <-             keyword.operator.subprocess.pyeval.xonsh
#^               meta.interpolation.command.xonsh
@('echo', 1)  # 2 Python Evaluation @(<expr>)
# <-             keyword.operator.subprocess.pyeval.xonsh
#^               punctuation.section.parens.begin.xonsh
#          ^     punctuation.section.parens.end.xonsh
# <-             meta.interpolation.command.xonsh
#^^^^^^^^^^^     meta.interpolation.command.xonsh
# ^^^^^^^^^^     meta.parens.interpolation.command
 @('echo', 1) # same starting with a space
#^               keyword.operator.subprocess.pyeval.xonsh
# ^              punctuation.section.parens.begin.xonsh
#           ^    punctuation.section.parens.end.xonsh
#^^^^^^^^^^^^    meta.interpolation.command.xonsh
#  ^^^^^^^^^^    meta.parens.interpolation.command
$(echo 1)     # 3 $(<expr>) Captured Subprocess
# <-             keyword.operator.subprocess.captured.xonsh
#^               punctuation.section.parens.begin.xonsh
#       ^        punctuation.section.parens.end.xonsh
# <-             meta.interpolation.command.xonsh
#^^^^^^^^        meta.interpolation.command.xonsh
# ^^^^^^^        meta.parens.interpolation.command
!(echo 1)     #   !(<expr>)
# <-             keyword.operator.subprocess.captured.xonsh
#^               punctuation.section.parens.begin.xonsh
#       ^        punctuation.section.parens.end.xonsh
# <-             meta.interpolation.command.xonsh
#^^^^^^^^        meta.interpolation.command.xonsh
# ^^^^^^^        meta.parens.interpolation.command
$[echo 1]     # 4 $[<expr>] Uncaptured Subprocess
# <-             keyword.operator.subprocess.uncaptured.xonsh
#^               punctuation.section.brackets.begin.xonsh
#       ^        punctuation.section.brackets.end.xonsh
# <-             meta.interpolation.command.xonsh
#^^^^^^^^        meta.interpolation.command.xonsh
# ^^^^^^^        meta.brackets.interpolation.command
![echo 1]     #   ![<expr>]
# <-             keyword.operator.subprocess.uncaptured.xonsh
#^               punctuation.section.brackets.begin.xonsh
#       ^        punctuation.section.brackets.end.xonsh
# <-             meta.interpolation.command.xonsh
#^^^^^^^^        meta.interpolation.command.xonsh
# ^^^^^^^        meta.brackets.interpolation.command

# 5 Test xonsh function globbing @foo`bar`
@find`needle` # Function globbing @foo`bar`
# <-             punctuation.definition.annotation.xonsh
#    ^           punctuation.definition.string.begin.xonsh
#    ^           punctuation.section.arguments.begin.xonsh
#           ^    punctuation.definition.string.end.xonsh
#           ^    punctuation.section.arguments.end.xonsh
#    ^^^^^^^^    string.quoted.backtick.xonsh
#    ^^^^^^^^    meta.string.xonsh
#    ^^^^^^^^    meta.function-call.arguments.xonsh
#^^^^            meta.function-call.xonsh
