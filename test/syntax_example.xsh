# Builtin functions are highlighted differently...
abbrevs(); aliases(); compilex(); execx(); evalx(); events(); print_color(); exit(); printx()
# ... vs regular functions
notabbrevs()

# Variables have the dollar $ign scoped as punctuation and highlighted accordingly
$             # 0 Match a single variable definition symbol to help with completions
$varA[$]      #   ...including for item access
funct($)      #   ...including for function calls
$varA = [1,2] # 1 Regular variable $var
$varB = 0     #
$varA[0]      # 2 Variable indexing $var[0]
$varA[$varB]  # 3 Variable inside an index $var[$var]
funct($varB)  #   Variable inside a function fn($var)
f"{$varA}"    # 4 Function strings
${...}        # 5 The environment itself
'H' in ${...} #
${'USER'}     #   ${<expr>} Environment Lookup
"not $varA $" # 6 (Python) Comment

# Subprocess operators $() $[] ${} @() @$() !() ![] are not ‘invalid.illegal.character’ anymore
@$(which ls)  # 1 Command Substitution @$(<expr>)
@$            #   don't scope ‘$’ as ‘invalid.illegal.character’
@('echo', 1)  # 2 Python Evaluation @(<expr>)
$(echo 1)     # 3 $(<expr>) Captured Subprocess
!(echo 1)     #   !(<expr>)
$[echo 1]     # 4 $[<expr>] Uncaptured Subprocess
![echo 1]     #   ![<expr>]
A @ B         # 5 (Python) matrix multiplication...
@annotation   #   (Python) ... and annotations are preserved

# Custom function globbing doesn’t trip over `backticks`
@foo`bi`

# Known issues
echo "$HOME" as well as '$HOME'   # illegal Python names that are legal in a subprocess mode
echo "$HOME" 'as well as' '$HOME' # use quotes
