# Connect to Azure and select the correct 
#.\ConnectAndSelectSuscription.ps1

# Use your Vault by Name
$MessageVault = "Input Name of Service Vault: "
$MessageThanks = "Thank You!"

# Select the Service Vault by user
$MessageVault
$VaultName = Read-Host
$MessageThanks
$Vault = Get-AzureRmRecoveryServicesVault -Name $VaultName
Set-AzureRmRecoveryServicesVaultContext -Vault $Vault
