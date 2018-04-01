OBJBASE:=opnaw p86drv pmdwin ppsdrv ppz8l table util
OBJBASE+=file fmgen fmtimer opna psg

CPPFLAGS:=-DNDEBUG
CPPFLAGS+=-I../fmgen
TARGET:=pmdwin.dll
DEF:=../pmdwin/pmdwin.def
