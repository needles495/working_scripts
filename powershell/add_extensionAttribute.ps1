Import-Module ActiveDirectory

#list in file samaccountname per str
$users = get-content C:\users.txt
$domain = example.com

ForEach ($user in $users) {
   #add:
   Get-aduser -identity $user | set-aduser -Add @{extensionAttribute2="$user@$domain"}
   #replace existing:
   #Get-aduser -identity $user | set-aduser -Replace @{extensionAttribute2="$user@$domain"}
   echo $user@$domain
}
