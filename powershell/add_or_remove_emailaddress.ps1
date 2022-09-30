Import-Module ActiveDirectory

$users = get-content C:\users.txt
$domain= "example.com"
ForEach ($user in $users) {
   
   #disable email:
   Get-aduser -identity $user -prop emailaddress | Set-ADUser -EmailAddress $null
   #add new email:
   Get-aduser -identity $user -prop emailaddress | Set-ADUser -EmailAddress $user@$domain
   echo $user@$domain
}
