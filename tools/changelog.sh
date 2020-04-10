#!/bin/sh

export Changelog=Changelog.txt

if [ -f $Changelog ];
then
	rm -f $Changelog
fi

touch $Changelog

echo "Generating changelog..."

for i in $(seq 14);
do
export After_Date=`date --date="$i days ago" +%m-%d-%Y`
k=$(expr $i - 1)
	export Until_Date=`date --date="$k days ago" +%m-%d-%Y`

	# Line with after --- until was too long for a small ListView
	echo '=======================' >> $Changelog;
	echo  "     "$Until_Date       >> $Changelog;
	echo '=======================' >> $Changelog;
	echo >> $Changelog;

while read path;
do
    Git_log=`git --git-dir ./${path}/.git log --after=$After_Date --until=$Until_Date --pretty=tformat:"%h  %s  [%an]" --abbrev-commit --abbrev=7`
    if [ ! -z "${Git_log}" ]; then
        echo "\n* ${path}\n${Git_log}\n" >> $Changelog;
    fi
done < ./.repo/project.list;

echo "" >> $Changelog;
done

sed -i 's/project/   */g' $Changelog

cp $Changelog $OUT/system/etc/
cp $Changelog $OUT/
rm -rf $Changelog
