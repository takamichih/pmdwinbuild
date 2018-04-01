vpath %.cpp ../pmdwin
vpath %.cpp ../fmgen
vpath %.cpp ../mincpp
.PHONY:	clean

include ../pmdwin.mak
OBJS:=$(addsuffix .o,$(OBJBASE) mincpp)

PREFIX:=i686-w64-mingw32-
CC:=$(PREFIX)gcc
CXX:=$(PREFIX)g++
CPPFLAGS+=-O2
CPPFLAGS+=-Wall -Wextra
#CPPFLAGS+=-Wall -Wextra -Werror -Wno-unused-parameter -Wno-sign-compare
#CPPFLAGS+=-Wno-parentheses -Wno-delete-non-virtual-dtor -Wno-unused-variable
#CPPFLAGS+=-Wno-switch -Wno-implicit-fallthrough -Wno-maybe-uninitialized
#CPPFLAGS+=-Wno-stringop-overflow -Wno-narrowing
CPPFLAGS+=-DPMDWIN_EXPORTS
CPPFLAGS+=-ansi
CPPFLAGS+=-fno-exceptions -fno-rtti
CPPFLAGS+=-finput-charset=cp932 -fexec-charset=cp932
LDFLAGS:=-static-libgcc -Wl,--kill-at -s

$(TARGET):	$(OBJS)
	$(CC) $(LDFLAGS) -shared -o $@ $^

clean:
	rm -f $(OBJS) $(TARGET)
