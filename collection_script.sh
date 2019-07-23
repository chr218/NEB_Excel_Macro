#!/bin/bash


rm OSZICARS.txt
DIR_present=$(pwd)
arr=$(find . -type d -name 'image*')
touch OSZICARS.txt

for dir in $arr
do
        cd $dir
        if grep -q 'reached required accuracy' out; then
                echo $(pwd)
                echo $(pwd) >> $DIR_present/OSZICARS.txt
                #echo $(tail -1 OSZICAR) >> $DIR_present/OSZICARS.txt
                arr3=$(~/bin/get_energies.sh)
                for eng1 in $arr3
                do
                        echo $eng1 >> $DIR_present/OSZICARS.txt
                done

        fi
        cd ../
        arr2=$(find . -type d -name 'EDIFF*')
        DIR_present_2=$(pwd)
                for dir2 in $arr2
                do
                        if grep -q 'reached required accuracy' out; then
                                cd $dir2
                                echo $(pwd)
                                echo $(pwd) >> $DIR_present/OSZICARS.txt
                                arr4=$(~/bin/get_energies.sh)
                                for eng in $arr4:
                                do
                                        echo $eng >> $DIR_present/OSZICARS.txt
                                done
                                cd $DIR_present2
                        fi
                done

        cd $DIR_present
done
