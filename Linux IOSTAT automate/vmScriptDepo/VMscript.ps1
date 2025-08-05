$rgName = "test015"
$location = "eastus"
New-AzResourceGroup -Name $rgName -Location $location
$template = "D:\Devops Practice\MotaData Assignment\Linux IOSTAT automate\vmScriptDepo\VMScript.json"
$parameter="D:\Devops Practice\MotaData Assignment\Linux IOSTAT automate\vmScriptDepo\VMScript.parameters.json"
New-AzResourceGroupDeployment `
    -Name deploy1 `
    -storageName store1 `
    -ResourceGroupName $rgName `
    -TemplateFile $template `
    -TemplateParameterFile $parameter -Verbose