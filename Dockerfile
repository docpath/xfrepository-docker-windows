# escape=`
FROM openjdk:8-windowsservercore
SHELL ["powershell", "-command"]

RUN mkdir C:\install_tmp
COPY xfrepositorypack-6.x.y.z-java.jar C:\install_tmp\xfrepository-installer.jar
WORKDIR C:\install_tmp
RUN java -jar C:\install_tmp\xfrepository-installer.jar -solname'DocPath XF Repository Service 6' -install -solution'C:\docpath\XFService' `
         -silentmode -console -licserverpath'C:\DocPath\DocPath License\DocPath License Server' -licserverport1765
WORKDIR C:\
RUN Remove-Item C:\install_tmp -Recurse
COPY DocPath_License_File.lic C:\docpath\Licenses\

EXPOSE 6502

COPY run.ps1 c:\

#ENTRYPOINT ["powershell.exe", "-NoLogo", "-ExecutionPolicy", "Bypass"]
ENTRYPOINT ["powershell", "c:\\run.ps1"]
