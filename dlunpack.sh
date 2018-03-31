set -e

function unpack {
  mkdir "${1}"
  cd "${1}"
  7z x ../"${2}"
  for file in *; do
    sfile="$(echo "${file}" | tr A-Z a-z)"
    if [ "${file}" != "${sfile}" ] ; then
      if [ -e "${sfile}" ] ; then
        echo "cannot rename file to lowercase"
        exit 1
      fi
      mv "${file}" "${sfile}"
    fi
  done
  cd ..
}


pmdwin=PMDWinS036.lzh
fmgen=fmgen008.lzh
wget http://c60.la.coocan.jp/download/${pmdwin}
wget http://retropc.net/cisc/m88/dl/${fmgen}
sha256sum -c sha256.sum
unpack pmdwin ${pmdwin}
unpack fmgen ${fmgen}
