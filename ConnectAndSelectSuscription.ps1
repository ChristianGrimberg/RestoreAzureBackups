# Login into Azure with a account
Login-AzureRmAccount

# Use your Suscription by Name
$MessageSuscription = "Input Name of Suscription: "
$MessageThanks = "Thank You!"
$MessageSuscription
$SuscriptionName = Read-Host
$MessageThanks

# Set the correct suscription where revovery service vault exist
Set-AzureRmContext -Subscription $SuscriptionName
Select-AzureRmSubscription -SubscriptionName $SuscriptionName
