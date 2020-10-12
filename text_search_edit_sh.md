# Text stream utils
## grep

Finding exactly one match, display 12 lines after and 15 lines before
```sh
grep -m 1 A12 B15 -r "match" .
```
Ignoring cases and showing only files containing ```MATCH``` (not occurences)
```sh
grep -i -l -r "MATCH" .
```
Counting occurences of MATCH
```sh
grep -c -r "MATCH" .
```
Ignoring lines containing ```MATCH1``` or ```MATCH2``` (```-v``` is an inverted match)
```sh
grep -v "MATCH1\|MATCH22
```
## find
Searching only at directory depth 1 (1 sub directory level): this can be useful to seach for files at a known depth and avoid sarching in all subdirectories (imagine having a 500Go folder so it can take quite a while)
```sh
find -maxdepth 1 . -name "match"
```
## sed (stream editor)
Extracting text between ```MATCH1``` and ```MATCH2```
```sh
sed -n "/STRING1/,/STRING2/"
```
Matching all lines starting with ```MATCH```
```sh
sed -n "/^MATCH/p"
```
## awk
Displaying columns 2,6 and the last one, seperated by a space
```sh
awk '{print $2 " " $6 " " $NF}'
```
## Combining all the above
### Useful one liners
Finding all lines with ```MATCH1```, getting first occurence, delete ```|``` charater and print 6th column 
```sh
grep "MATCH1" file.log | head -n 1 | sed 's/|//g' | awk '{print \$6}'
```
Finding all lines with ```MATCH1```, substitute ```  MATCH2 = 123 ; MATCH3 ``` with ```123```, do a numerical sort, get last value (tail value)
```sh
grep "MATCH1" file.log | sed 's/.*MATCH2 = \(.*\) ; MATCH3.*/\1/' | sort -n | tail -n 1
```
Extract text between ```MATCH1``` and ```MATCH2```, find a line with ```MATCH3```, substitute ```;``` with space, print 2nd column, sort alphanumerically, and only show unique values (remove duplicates) 
```sh
sed -n '/MATCH1/,/MATCH2/p' file.log | grep "MATCH3" | sed 's/;/ /g' | awk '{print \$2}'| sort | uniq
```
Loop line by line, find occurences of ```MATCH1```, and count lines with ```wc -l```
```sh
cat file.log | while read -r line; do grep -l MATCH1 $line; done | wc -l
```
### A simple script
This script is useful for matching strings in files and editing them accordingly.
```sh
#!/bin/sh

# match files starting from $DIR containing $MATCH, finding file.log (treat grep output as paths)
# and loop between results (if file.log was found) 
grep -rl "$MATCH" $DIR | find $DIR -name "file.log" |
while read -r line
do
    # print first column and replace ab:cd with ab (delete what's after :)
    awk '{print $1}' $line | sed -r 's/(^.*):.*/\1/'
    
    # do something if found string in a file
    if grep -q "MATCH1" "$line"; then
        echo "FOUND MATCH1 in $line"
    else
        echo "MATCH1 not found"
    fi
    
    # find files with lines starting with MATCH1 and ending with MATCH2, append result to matches.log 
    grep -rl "MATCH1.*MATCH2" $line >> matches.log
    # set file as edit (perforce)
    p4 edit $line
    echo "Opened file $line as edit"
done
```
