# convert markdown --> word

pandoc -o output.docx -f markdown -t docx markdown-file.md

# Multi Byte / Unicode Character Transform 

- convert ^m to newline
    - tr 

- remove non unicode
perl -i.bak -pe 's/[^[:ascii:]]//g' <your file>

# Whitespace Transform

- delete blank lines
    - sed '/^\s*$/d'
- replace spaces with <cr>
tr '[:space:]' '\n' < file
tr '[:space:]' '\n' < 
- remove all blank lines
grep -v '^$' infile.txt > outfile.txt

# CSV / Column Transformations

- remove anything with 2 columns 
    - awk 'NF>=3' file
    - http://stackoverflow.com/questions/15643440/sed-awk-how-to-remove-lines-with-less-than-3-columns