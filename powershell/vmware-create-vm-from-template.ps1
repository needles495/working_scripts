$templateName = 'template'
$esxName = 'esxi01'
$dsName = 'ds'
$template = Get-Template -Name $templateName
$ds = Get-Datastore -Name $dsName
$esx = Get-VMHost -Name $esxName

$vm = New-VM -Template $template -Name stressTest -VMHost $esx -Datastore $ds -DiskStorageFormat Thin |
Set-VM -NumCpu 2 -MemoryGB 4 -Confirm:$false
Get-HardDisk -VM $vm | Set-HardDisk -CapacityGB 100
Start-VM -VM $vm -Confirm:$false
