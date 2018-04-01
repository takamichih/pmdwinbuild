set -e

function unpack {
  mkdir "${1}"
  cd "${1}"
  7z x ../"${2}"
  for file in *; do
    sfile="$(echo "${file}" | tr A-Z a-z)"
    if [ "${file}" != "${sfile}" ] ; then
      mv "${file}" "${sfile}"
    fi
  done
  dos2unix *
  cd ..
}


pmdwin=PMDWinS036.lzh
fmgen=fmgen008.lzh
wget http://c60.la.coocan.jp/download/${pmdwin}
wget http://retropc.net/cisc/m88/dl/${fmgen}
sha256sum -c sha256.sum
unpack pmdwin ${pmdwin}
unpack fmgen ${fmgen}
