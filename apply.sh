#!/bin/bash

apply() {
	[ ! -n "$ANDROID_BUILD_TOP" ] && echo "Please specify ANDROID_BUILD_TOP before running this script" && return
	source $ANDROID_BUILD_TOP/local_manifests/common.sh

	while read line; do
		proj=$(echo $line | cut -d " " -f1)
		echo -e $CL_BLU"Applying patches to $proj"$CL_RST
		echo
		git -C $ANDROID_BUILD_TOP/$(echo $line)
		echo ""; echo "";
	done < $ANDROID_BUILD_TOP/local_manifests/patches.txt
}

apply
