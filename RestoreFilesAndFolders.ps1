# Download the credential vault to C:\Vaults and named as credentials.VaultCredentials
$File = "C:\Vaults\credentials.VaultCredentials"
$ArrayBackupServer = Get-OBAlternateBackupServer -VaultCredentials $File

# Array list to all Microsoft.Internal.CloudBackup.ObjectModel.OMCommon.CBBackupServer
$CBBackupServers = $ArrayBackupServer[2]

# List all CBBackupServers
foreach ($BackupServer in $CBBackupServers)
{
    Get-OBRecoverableSource -Server $BackupServer
}