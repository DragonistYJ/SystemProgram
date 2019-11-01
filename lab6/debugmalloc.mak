# Microsoft Developer Studio Generated NMAKE File, Based on debugmalloc.dsp
!IF "$(CFG)" == ""
CFG=debugmalloc - Win32 Debug
!MESSAGE No configuration specified. Defaulting to debugmalloc - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "debugmalloc - Win32 Release" && "$(CFG)" != "debugmalloc - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "debugmalloc.mak" CFG="debugmalloc - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "debugmalloc - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "debugmalloc - Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "debugmalloc - Win32 Release"

OUTDIR=.\Release
INTDIR=.\Release
# Begin Custom Macros
OutDir=.\Release
# End Custom Macros

ALL : "$(OUTDIR)\debugmalloc.exe"


CLEAN :
	-@erase "$(INTDIR)\debugmalloc.obj"
	-@erase "$(INTDIR)\dmhelper.obj"
	-@erase "$(INTDIR)\driver.obj"
	-@erase "$(INTDIR)\getopt.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\debugmalloc.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /ML /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /Fp"$(INTDIR)\debugmalloc.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\debugmalloc.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\debugmalloc.pdb" /machine:I386 /out:"$(OUTDIR)\debugmalloc.exe" 
LINK32_OBJS= \
	"$(INTDIR)\debugmalloc.obj" \
	"$(INTDIR)\dmhelper.obj" \
	"$(INTDIR)\driver.obj" \
	"$(INTDIR)\getopt.obj"

"$(OUTDIR)\debugmalloc.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "debugmalloc - Win32 Debug"

OUTDIR=.
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.
# End Custom Macros

ALL : "$(OUTDIR)\debugmalloc.exe"


CLEAN :
	-@erase "$(INTDIR)\debugmalloc.obj"
	-@erase "$(INTDIR)\dmhelper.obj"
	-@erase "$(INTDIR)\driver.obj"
	-@erase "$(INTDIR)\getopt.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\debugmalloc.exe"
	-@erase "$(OUTDIR)\debugmalloc.ilk"
	-@erase "$(OUTDIR)\debugmalloc.pdb"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /Fp"$(INTDIR)\debugmalloc.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\debugmalloc.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\debugmalloc.pdb" /debug /machine:I386 /out:"$(OUTDIR)\debugmalloc.exe" /pdbtype:sept 
LINK32_OBJS= \
	"$(INTDIR)\debugmalloc.obj" \
	"$(INTDIR)\dmhelper.obj" \
	"$(INTDIR)\driver.obj" \
	"$(INTDIR)\getopt.obj"

"$(OUTDIR)\debugmalloc.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("debugmalloc.dep")
!INCLUDE "debugmalloc.dep"
!ELSE 
!MESSAGE Warning: cannot find "debugmalloc.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "debugmalloc - Win32 Release" || "$(CFG)" == "debugmalloc - Win32 Debug"
SOURCE=.\debugmalloc.c

"$(INTDIR)\debugmalloc.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\dmhelper.c

"$(INTDIR)\dmhelper.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\driver.c

"$(INTDIR)\driver.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\getopt.c

"$(INTDIR)\getopt.obj" : $(SOURCE) "$(INTDIR)"



!ENDIF 

