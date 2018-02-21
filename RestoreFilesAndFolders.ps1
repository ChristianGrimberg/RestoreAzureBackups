# Connect to Azure and select the correct 
.\ConnectAndSelectSuscription.ps1

# Message to user
$MessagePassword = "Imput Password of "
$MessageThanks = "Thank You!"

# Location to restore the data
$DestinationRestoredData = "D:\RestoredData\"
$NumberFolder = 0

# Download the credential vault to C:\Vaults and named as credentials.VaultCredentials
$FileVault = "C:\Vaults\credentials.VaultCredentials"
$ArrayBackupServer = Get-OBAlternateBackupServer -VaultCredentials $FileVault

# Array list to all Microsoft.Internal.CloudBackup.ObjectModel.OMCommon.CBBackupServer
$CBBackupServers = $ArrayBackupServer[2]

# List all items in the retention backup to restore
foreach ($BackupServer in $CBBackupServers)
{
    # Imput Password
    $ServerName = $BackupServer.ServerName
    $MessagePassword + $ServerName + ": "
    $SecureString = Read-Host -AsSecureString
    $MessageThanks
    
    # Obtain all the BackupServers in vault
    $Source = Get-OBRecoverableSource -Server $BackupServer
    
    foreach ($RecoverableVolume in $Source)
    {
        # Obtain all volume item of BackupServers
        $RecoverableItem = Get-OBRecoverableItem -Source $RecoverableVolume
    }

    foreach ($FilesFolders in $RecoverableItem)
    {
        # Obtain all the folders of volume items
        $FolderRecover = Get-OBRecoverableItem $FilesFolders

        #Increment the number of folder
        $NumberFolder++

        #Define the Folder
        $FolderRestoredData = $DestinationRestoredData + $ServerName + "\" + $NumberFolder

        # Trigger the process of restore
        $RecoveryOption = New-OBRecoveryOption -DestinationPath $FolderRestoredData -OverwriteType Skip

        foreach ($FilesRecover in $FolderRecover)
        {
            $ItemRecover = Get-OBRecoverableItem $FilesRecover

            Start-OBRecovery -RecoverableItem $ItemRecover -RecoveryOption $RecoveryOption -EncryptionPassphrase $SecureString
        }       
    }
}

# Disconnect of Azure
.\TenantDisconnect.ps1