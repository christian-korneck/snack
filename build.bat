@echo off
setlocal

set destdir=c:\dist

curl -L https://www.python.org/ftp/python/3.7.9/python-3.7.9-amd64.exe -o %tmp%\python-setup.exe


%tmp%\python-setup.exe /quiet TargetDir=c:\py Include_lib=1 Include_symbols=1 CompileAll=1 Include_dev=1 PrependPath=0 AssociateFiles=0 Shortcuts=0 Include_doc=0 Include_test=0 Include_tools=0 Include_pip=0 Include_launcher=0 Include_exe=1
curl -L https://www.python.org/ftp/python/3.7.9/python-3.7.9-embed-amd64.zip -o %tmp%\python-min.zip
mkdir "%destdir%"
powershell -c "Expand-Archive -Path \"${env:tmp}\python-min.zip\" -DestinationPath \"${env:destdir}\" -force"
choco install /y pkgconfiglite
set PKG_CONFIG_PATH=%~dp0pkg-config
go build -o "%destdir%"
