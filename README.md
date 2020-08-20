# Docker Configuration Files for DocPath ® XF Repository Service 6

This is a complete example about how to deploy DocPath ® XF Repository Service 6 in Windows Server Core using Docker for Windows. The example must be completed with the following files in the same directory as the repositorized files:

- xfrepositorypack-6.x.y.z-java.jar: DocPath ® XF Repository Service 6 Installer.
- DocPath License File.lic: License file.
 
## Steps 
To successfully perform the example follow the steps as indicated below:
- Use the openjdk:8-windowsservercore image, contains a OpenJDK 8 pre-installed.
- Install DocPath ® DocPath ® XF Repository Service 6.
- Copy the license file into the image.
- Use port 6502 to receive generation requests.
- Run the run1.ps file on the container entrypoint. run1.ps is performed as follows :
  - Starts the license server to allow DocPath ® XF Repository Service 6 execution.
  - Deploys DocPath ® DocPath ® XF Repository Service 6.

## Necessary changes
- Change the xfrepositorypack-6.x.y.z-java.jar with the corresponding version of DocPath ® DocPath ® XF Repository Service 6.
- Change the DocPath_License_File.lic file with the corresponding license filename.

## How to build and deploy
Now we are going to build the container by executing the following sequence in the same directory where the dockerfile file is located:

`docker build -t docpath/xfrepository . `

**IMPORTANT!** the full stop at the end indicates the directory where the container is located, this is mandatory.

Run the container once it has been built, use the following sequence:

`docker run --name xfrepository --hostname <hostname_container> --detach -p 6502:6502 -e AIM_URL='http://<aim_url>:8080/aim' -e AIM_ID='<aim_token>' docpath/xfrepository `

The used parameters are:
- --name: this parameter indicates the name of the container, in this case dge.
- --hostname: this parameter indicates the hostname of the machine with license.
- --detach: this parameter indicates that no messages are displayed in the execution console, silent mode.
- -p8084:8084: this parameter indicates the port of both host machine and dge.
- docpath/dge: this is the name assigned previously while building the container.
- aim_url: URL with DocPath Access and Identity Management is installed.
- aim_token: Token assigned in Access and Identity Management to XF Repository Service 6.
