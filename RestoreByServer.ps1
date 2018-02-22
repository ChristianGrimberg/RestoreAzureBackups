# Connect to Azure and select the correct 
.\ConnectAndSelectSuscription.ps1

# Declare message imput to users
$MessagePassword = "Imput Password of "
$MessageServer = "Input Name of Server: "
$MessageThanks = "Thank You!"
$DestinationRestoredData = "C:\RestoredData\"
$NumberFolder = 0

# Select the Server
# Download the credential vault to C:\Vaults and named as credentials.VaultCredentials
$MessageServer
$Server = Read-Host
$MessageThanks
$FileVault = "C:\Vaults\credentials.VaultCredentials"
$BackupServer = Get-OBAlternateBackupServer -VaultCredentials $FileVault

# Imput Password of Server
$MessagePassword + $Server + ": "
$SecureString = Read-Host -AsSecureString
$MessageThanks

# Obtain the source of backup server
$CBBackupServer = $BackupServer[2] | where {$_.ServerName -eq $Server}
$Source = Get-OBRecoverableSource -Server $CBBackupServer
$Source

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
    $FolderRestoredData = $DestinationRestoredData + $Server + "\" + $NumberFolder

    # Trigger the process of restore
    $RecoveryOption = New-OBRecoveryOption -DestinationPath $FolderRestoredData -OverwriteType Skip

    foreach ($FilesRecover in $FolderRecover)
    {
        $ItemRecover = Get-OBRecoverableItem $FilesRecover

        Start-OBRecovery -RecoverableItem $ItemRecover -RecoveryOption $RecoveryOption -EncryptionPassphrase $SecureString
    }       
}
