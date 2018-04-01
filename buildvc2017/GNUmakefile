vpath %.cpp ../pmdwin
vpath %.cpp ../fmgen
vpath %.cpp ../mincpp
.PHONY:	clean

include ../pmdwin.mak

OBJS:=$(addsuffix .obj,$(OBJBASE))
CC:=cl -nologo
LINK:=link -nologo
CPPFLAGS+=-W3
CPPFLAGS+=-O2
CPPFLAGS+=-D_CRT_SECURE_NO_WARNINGS
CPPFLAGS+=-EHs-c-
CPPFLAGS+=-LD
LDFLAGS:=-DLL 

$(TARGET):	$(OBJS)
	$(LINK) $(LDFLAGS) $(OBJS) /OUT:$@ /DEF:$(DEF)

clean:
	del /q $(OBJS) $(TARGET) *.exp *.lib

%.obj:	%.cpp
	$(CC) $(CPPFLAGS) $(CXXFLAGS) -c $< -Fo$@
