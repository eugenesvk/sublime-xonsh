# Builtin functions are highlighted differently...
abbrevs(); notabbrevs() # ... vs the regular functions

# Variables have the dollar $ign scoped as punctuation and highlighted accordingly
$; $varA[$]; funct($)               	# Var definition symbol (+index & function)
$varA = [1,2]; $varB = 0            	# Regular variable
$varA[0]; $varA[$varB]; funct($varB)	# Variable indexing (+index & function)
f"{$varA}"                          	# Function string
${...}; 'H' in ${...}; ${'USER'}    	# Environment
"$ not $varA"                       	# (Python) Comments preserved

# Subprocess operators $() $[] ${} @() @$() !() ![] are not ‘invalid.illegal’
@$(which ls); @$    	                # Command Substitution
@('echo', 1)        	                # Python Evaluation
$(echo 1); !(echo 1)	                # Captured Subprocess
$[echo 1]; ![echo 1]	                # Uncaptured Subprocess
A @ B               	                # (Python) matrix multiplications...
@annotation         	                # (Python) ... and annotations are preserved

# Custom function globbing doesn’t trip over `backticks`
@foo`bi`
