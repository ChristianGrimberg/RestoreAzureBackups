# Download the credential vault to C:\Vaults and named as credentials.VaultCredentials
$File = "C:\Vaults\credentials.VaultCredentials"
$ArrayBackupServer = Get-OBAlternateBackupServer -VaultCredentials $File

# Array list to all Microsoft.Internal.CloudBackup.ObjectModel.OMCommon.CBBackupServer
$CBBackupServers = $ArrayBackupServer[2]

# List all items in the retention backup to restore
foreach ($BackupServer in $CBBackupServers)
{
    $Source = Get-OBRecoverableSource -Server $BackupServer
    
    foreach ($RecoverableVolume in $Source)
    {
        $RecoverableItem = Get-OBRecoverableItem -Source $RecoverableVolume
    }

    $RecoverableItem
}
