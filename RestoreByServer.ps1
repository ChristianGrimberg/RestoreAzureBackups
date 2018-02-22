# Connect to Azure and select the correct 
#.\ConnectAndSelectSuscription.ps1

# Declare message imput to users
$MessageVault = "Input Name of Service Vault: "
$MessagePassword = "Imput Password of "
$MessageServer = "Input Name of Server: "
$MessageThanks = "Thank You!"
$DestinationRestoredData = "D:\RestoredData\"
$NumberFolder = 0

# Select the Service Vault by user
$MessageVault
$VaultName = Read-Host
$MessageThanks
$Vault = Get-AzureRmRecoveryServicesVault -Name $VaultName
Set-AzureRmRecoveryServicesVaultContext -Vault $Vault

# Select the Server
# Download the credential vault to C:\Vaults and named as credentials.VaultCredentials
$MessageServer
$Server = Read-Host
$MessageThanks
$FileVault = "C:\Vaults\credentials.VaultCredentials"
$BackupServer = Get-OBAlternateBackupServer -VaultCredentials $FileVault -Name $Server
