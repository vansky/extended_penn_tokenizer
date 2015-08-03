#!/bin/sed -f

### Untokenize script available at: https://github.com/vansky/extended_penn_tokenizer

# Sed script to undo Penn Treebank tokenization on arbitrary raw text.
# expected input: tokenized text with ONE SENTENCE TOKEN PER LINE

# attempt to get correct directional quotes
s=`` =``=g
s= ''=''=g

s= \.\.\.=...=g
s= \([!?;]\) \1=\1=g
s= \([%:]\)=\1=g
s=\([$#]\) =\1=g
s= \([,.]\)=\1=g
s=,,=,=g

# parentheses, brackets, etc.
# Some taggers, such as Adwait Ratnaparkhi's MXPOST, use the parsed-file
# version of these symbols.
# UNCOMMENT THE FOLLOWING 6 LINES if you're using MXPOST.
s/-LRB-/(/g
s/-RRB-/)/g
s/-LSB-/\[/g
s/-RSB-/\]/g
s/-LCB-/{/g
s/-RCB-/}/g

s=\([([<{]\) =\1=g
s= \([])}>]\)=\1=g

s= --=--=g

# NOTE THAT SPLIT WORDS WERE NOT MARKED.  

# First off, add a space to the beginning and end of each line, to reduce
# necessary number of regexps.
s=$= =
s=^= =

# handle contractions
s= '='=g
s= n't=n't=g
s= N'T=N'T=g
#s= \([Cc]\)annot = \1an not =g
#s= \([Dd]\)'ye = \1' ye =g
#s= \([Gg]\)imme = \1im me =g
#s= \([Gg]\)onna = \1on na =g
#s= \([Gg]\)otta = \1ot ta =g
#s= \([Ll]\)emme = \1em me =g
#s= \([Mm]\)ore'n = \1ore 'n =g
#s= '\([Tt]\)is = '\1 is =g
#s= '\([Tt]\)was = '\1 was =g
#s= \([Ww]\)anna = \1an na =g

# clean out extra spaces
s=  *= =g
s=^ *==g
