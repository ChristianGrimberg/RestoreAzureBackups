# Connect to Azure and select the correct 
.\ConnectAndSelectSuscription.ps1

# Select the Service Vault by user
$MessageVault = "Input Name of Service Vault: "
$MessageThanks = "Thank You!"
$MessageVault
$VaultName = Read-Host
$MessageThanks

# Folder Path to archive
$CredentialFolderDestination = "C:\Vaults"
$Vault = Get-AzureRmRecoveryServicesVault -Name $VaultName
$FileName = Get-AzureRmRecoveryServicesVaultSettingsFile -Backup -Vault $Vault[0] -Path $CredentialFolderDestination
$FileToLoad = $FileName[0].FilePath
$Server = Get-OBAlternateBackupServer -VaultCredentials $FileToLoad

$Server
