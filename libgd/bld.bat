REM Build script for Windows

REM set up the compiler (Visual Studio for Python2.7)
REM IF this doesn't work -- run this from the Visual Studio 64 command prompt
call "%HOMEPATH%\AppData\Local\Programs\Common\\Microsoft\Visual C++ for Python\9.0\vcvarsall.bat" amd64

echo current working dir is:
echo %cd%
REM Build the lib...
nmake /f %RECIPE_DIR%\Makefile.vc build_libs
if errorlevel 1 exit 1

REM done compiling

REM Install step
copy libgd.dll %LIBRARY_BIN%\
if errorlevel 1 exit 1
copy libgd.lib %LIBRARY_LIB%\
if errorlevel 1 exit 1
copy libgd.lib %LIBRARY_LIB%\gd.lib
if errorlevel 1 exit 1
copy libgd_a.lib %LIBRARY_LIB%\
if errorlevel 1 exit 1
copy src\*.h %LIBRARY_INC%\	
if errorlevel 1 exit 1
