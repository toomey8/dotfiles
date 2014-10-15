
- remove non unicode
perl -i.bak -pe 's/[^[:ascii:]]//g' <your file>

- replace spaces with <cr>
tr '[:space:]' '\n' < file
tr '[:space:]' '\n' < 

- remove all blank lines
grep -v '^$' infile.txt > outfile.txt

- remove anything with 2 columns 
    - awk 'NF>=3' file
    - http://stackoverflow.com/questions/15643440/sed-awk-how-to-remove-lines-with-less-than-3-columns
