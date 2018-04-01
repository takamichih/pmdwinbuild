vpath %.cpp ../pmdwin
vpath %.cpp ../fmgen
vpath %.cpp ../mincpp
OBJS:=opnaw.o p86drv.o pmdwin.o ppsdrv.o ppz8l.o table.o util.o
OBJS+=file.o fmgen.o fmtimer.o opna.o psg.o
OBJS+=mincpp.o

PREFIX:=i686-w64-mingw32-
CC:=$(PREFIX)gcc
CXX:=$(PREFIX)g++
CPPFLAGS:=-O2
CPPFLAGS+=-Wall -Wextra
#CPPFLAGS+=-Wall -Wextra -Werror -Wno-unused-parameter -Wno-sign-compare
#CPPFLAGS+=-Wno-parentheses -Wno-delete-non-virtual-dtor -Wno-unused-variable
#CPPFLAGS+=-Wno-switch -Wno-implicit-fallthrough -Wno-maybe-uninitialized
#CPPFLAGS+=-Wno-stringop-overflow -Wno-narrowing
CPPFLAGS+=-DNDEBUG -DPMDWIN_EXPORTS
CPPFLAGS+=-ansi
CPPFLAGS+=-fno-exceptions -fno-rtti
CPPFLAGS+=-finput-charset=cp932 -fexec-charset=cp932
CPPFLAGS+=-I../fmgen
TARGET:=pmdwin.dll
LDFLAGS:=-static-libgcc -Wl,--kill-at -s

$(TARGET):	$(OBJS)
	$(CC) $(LDFLAGS) -shared -o $@ $^

clean:
	rm -f $(OBJS) $(TARGET)
