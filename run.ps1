$aim_url = "$env:AIM_URL"
$aim_id = "$env:AIM_ID"
$ini_file = 'C:\DocPath\XFService\Configuration\xfservice.ini'

Remove-Item "$ini_file"

Add-Content "$ini_file" '[Main]'
Add-Content "$ini_file" 'Port=6502'
Add-Content "$ini_file" 'Host IP = host_auto_ipv4'
Add-Content "$ini_file" 'Disable HTTPS = true'
Add-Content "$ini_file" 'Disable QPD File Compression = false'
Add-Content "$ini_file" 'Disable QDF File Compression = false'
Add-Content "$ini_file" 'Disable QFS File Compression = false'
Add-Content "$ini_file" 'Check Repository Before Connect = false'
Add-Content "$ini_file" 'Max Backup Files = 10'
Add-Content "$ini_file" 'Admin Token Expiration = 24hrs'
Add-Content "$ini_file" 'Frequency of Checking Unused Connections = 30mins'
Add-Content "$ini_file" ''
Add-Content "$ini_file" '[AIM]'
Add-Content "$ini_file" "AIM Server=$aim_url"
Add-Content "$ini_file" "AIM Id=$aim_id"
Add-Content "$ini_file" ''
Add-Content "$ini_file" '[Log]'
Add-Content "$ini_file" 'Log Level = 10'
Add-Content "$ini_file" 'Log Max Size = 1MB'
Add-Content "$ini_file" 'Log Max Backups = 5'
Add-Content "$ini_file" ''
Add-Content "$ini_file" '[License]'
Add-Content "$ini_file" 'Licenses Dir = C:\DocPath\Licenses'

net stop XFService
net start XFService

while ($true) {
    Start-Sleep -Seconds 300
}
