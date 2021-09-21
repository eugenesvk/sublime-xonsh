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
