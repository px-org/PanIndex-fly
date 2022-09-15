#!/bin/bash
version="$PAN_INDEX_VERSION"
if [ "$version" = "" ]
then
    version=`curl --silent "https://api.github.com/repos/libsgh/PanIndex/releases/latest" \
        | grep '"tag_name":' \
        | sed -E 's/.*"([^"]+)".*/\1/'`
fi
curl -sOL "https://github.com/libsgh/PanIndex/releases/download/${version}/PanIndex-linux-amd64.tar.gz"
md5sum "PanIndex-linux-amd64.tar.gz"
tar -zxvf "PanIndex-linux-amd64.tar.gz"
rm -rf README.md LICENSE
mv PanIndex-linux-amd64 PanIndex
chmod +x PanIndex
/app/PanIndex
