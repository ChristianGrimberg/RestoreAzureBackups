# Login into Azure with a account
Login-AzureRmAccount
# Use your Suscription by Name
$subscriptionName = "Azure bajo licencia Open"
# Set the correct suscription where revovery service vault exist
Set-AzureRmContext -Subscription $subscriptionName
Select-AzureRmSubscription -SubscriptionName $subscriptionName
# Query Service Vaults
$Resource = Get-AzureRmRecoveryServicesVault -ResourceGroupName "Default-RecoveryServices-ResourceGroup-brazilsouth"
$Resource

