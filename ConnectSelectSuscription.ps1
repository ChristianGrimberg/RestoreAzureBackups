Login-AzureRmAccount
$subscriptionName = "Azure bajo licencia Open"
Set-AzureRmContext -Subscription $subscriptionName

Select-AzureRmSubscription -SubscriptionName $subscriptionName -Current
