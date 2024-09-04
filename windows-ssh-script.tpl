add-content -path C:\Users\amose\.ssh\config -value @'

Host ${user}
   HostName ${hostname}
   User ${user}
   IdentityFile ${identityfile}
'@