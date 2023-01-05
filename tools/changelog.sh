#!/bin/bash

# Exports
DEVICE=$(echo $TARGET_PRODUCT | sed 's/evolution_//g')
out=$OUT_DIR/target/product/$DEVICE
if [ -f $out ]; # The path does not exist
then
	echo "The path to create changelog does not exist, exiting..."
	exit
fi

export Changelog=Changelog.txt

if [ -f $Changelog ];
then
	rm -f $Changelog
fi

# Assuming this script is run from TOP of workspace
export formatter_script=$(realpath vendor/evolution/tools/changelog_repo_formatter.sh)

touch $Changelog

# Print something to build output
echo "Generating changelog..."

for i in $(seq 14);
do
export After_Date=$(/usr/bin/date --date="$i days ago" +%Y/%m/%d)
k=$(expr $i - 1)
	export Until_Date=$(/usr/bin/date --date="$k days ago" +%Y/%m/%d)

	# Line with after --- until was too long for a small ListView
	echo '=======================' >> $Changelog;
	echo  "     "$Until_Date       >> $Changelog;
	echo '=======================' >> $Changelog;
	echo >> $Changelog;

	# Cycle through every repo to find commits between 2 dates
	repo forall -c '. $formatter_script' >> $Changelog
	echo >> $Changelog;
done

cp $Changelog $OUT_DIR/target/product/$DEVICE/system/etc/$Changelog
cp $Changelog $OUT_DIR/target/product/$DEVICE/
