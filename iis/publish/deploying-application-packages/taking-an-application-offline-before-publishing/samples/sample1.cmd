msdeploy.exe -verb:sync -source:iisApp=mySite -dest:auto,computername=<publishUrl> -enableRule:AppOffline