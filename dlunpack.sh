set -e

function unpack {
  mkdir "${1}"
  cd "${1}"
  7z x ../"${2}"
  for file in *; do
    sfile="$(echo "${file}" | tr "[:upper:]" "[:lower:]")"
    if [ "${file}" != "${sfile}" ] ; then
      mv "${file}" "${sfile}"
    fi
  done
  dos2unix ./*
  cd ..
}


pmdwin=PMDWinS036.lzh
fmgen=fmgen008.lzh
pmdwinbin=PMDWin036.lzh
if [ ! -e ${pmdwin} ] ; then wget http://c60.la.coocan.jp/download/${pmdwin} ; fi
if [ ! -e ${pmdwinbin} ] ; then wget http://c60.la.coocan.jp/download/${pmdwinbin} ; fi
if [ ! -e ${fmgen} ] ; then wget http://retropc.net/cisc/m88/dl/${fmgen} ; fi
sha256sum -c sha256.sum
unpack pmdwin ${pmdwin}
unpack pmdwinbin ${pmdwinbin}
unpack fmgen ${fmgen}
