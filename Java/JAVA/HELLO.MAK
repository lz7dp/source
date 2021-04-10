# Microsoft Developer Studio Generated NMAKE File, Format Version 4.20
# ** DO NOT EDIT **

# TARGTYPE "Java Virtual Machine Java Workspace" 0x0809

!IF "$(CFG)" == ""
CFG=hello - Java Virtual Machine Debug
!MESSAGE No configuration specified.  Defaulting to hello - Java Virtual\
 Machine Debug.
!ENDIF 

!IF "$(CFG)" != "hello - Java Virtual Machine Release" && "$(CFG)" !=\
 "hello - Java Virtual Machine Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "hello.mak" CFG="hello - Java Virtual Machine Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "hello - Java Virtual Machine Release" (based on\
 "Java Virtual Machine Java Workspace")
!MESSAGE "hello - Java Virtual Machine Debug" (based on\
 "Java Virtual Machine Java Workspace")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 
################################################################################
# Begin Project
JAVA=jvc.exe

!IF  "$(CFG)" == "hello - Java Virtual Machine Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ""
# PROP BASE Intermediate_Dir ""
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ""
# PROP Intermediate_Dir ""
# PROP Target_Dir ""
OUTDIR=.
INTDIR=.

ALL : "$(OUTDIR)\dpp.class" "$(OUTDIR)\dpp1.class"

CLEAN : 
	-@erase "$(INTDIR)\dpp.class"
	-@erase "$(INTDIR)\dpp1.class"

# ADD BASE JAVA /O
# ADD JAVA /O

!ELSEIF  "$(CFG)" == "hello - Java Virtual Machine Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ""
# PROP BASE Intermediate_Dir ""
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ""
# PROP Intermediate_Dir ""
# PROP Target_Dir ""
OUTDIR=.
INTDIR=.

ALL : "$(OUTDIR)\dpp1.class" "$(OUTDIR)\dpp.class"

CLEAN : 
	-@erase "$(INTDIR)\dpp.class"
	-@erase "$(INTDIR)\dpp1.class"

# ADD BASE JAVA /g
# ADD JAVA /g

!ENDIF 

################################################################################
# Begin Target

# Name "hello - Java Virtual Machine Release"
# Name "hello - Java Virtual Machine Debug"

!IF  "$(CFG)" == "hello - Java Virtual Machine Release"

!ELSEIF  "$(CFG)" == "hello - Java Virtual Machine Debug"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=.\dpp.java

!IF  "$(CFG)" == "hello - Java Virtual Machine Release"


"$(INTDIR)\dpp.class" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "hello - Java Virtual Machine Debug"


"$(INTDIR)\dpp.class" : $(SOURCE) "$(INTDIR)"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\dpp1.java

!IF  "$(CFG)" == "hello - Java Virtual Machine Release"


"$(INTDIR)\dpp1.class" : $(SOURCE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "hello - Java Virtual Machine Debug"


"$(INTDIR)\dpp1.class" : $(SOURCE) "$(INTDIR)"


!ENDIF 

# End Source File
# End Target
# End Project
################################################################################
