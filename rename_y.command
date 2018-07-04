#!/bin/sh

echo "tester"
# permission file: chmod u+x /path/to/file.command

for topdirectories in sot_map_tiles/*/
do
    #echo "-$topdirectories"
    for xdirs in $topdirectories*/
    do
        #echo "--$xdirs"
        filecount=$(ls "$xdirs" | grep '\.png$' | wc -l)
        #echo "count: $filecount"
        for file in $xdirs*
        do
            echo "$file"
        done

        #for i in $(seq $filecount 1); do echo $i; done
        #mkdir $xdirs/renamed
        dir="renamed"
        for (( i=0; i<$filecount; i++)); do
            ((newNum = $filecount-1-$i))
            newName="r_$newNum"
            echo $newNum " - " $newName

            mv "$xdirs$i.png" "$xdirs$newName.png"
        done

        for (( i=0; i<$filecount; i++)); do
            oldName="r_$i"
            echo $oldName " - " $i

            mv "$xdirs$oldName.png" "$xdirs$i.png"
        done
    done
done


