$assemblylist =
"Microsoft.SqlServer.Management.Common",
"Microsoft.SqlServer.Smo",
"Microsoft.SqlServer.Dmf ",
"Microsoft.SqlServer.Instapi ",
"Microsoft.SqlServer.SqlWmiManagement ",
"Microsoft.SqlServer.ConnectionInfo ",
"Microsoft.SqlServer.SmoExtended ",
"Microsoft.SqlServer.SqlTDiagM ",
"Microsoft.SqlServer.SString ",
"Microsoft.SqlServer.Management.RegisteredServers ",
"Microsoft.SqlServer.Management.Sdk.Sfc ",
"Microsoft.SqlServer.SqlEnum ",
"Microsoft.SqlServer.RegSvrEnum ",
"Microsoft.SqlServer.WmiEnum ",
"Microsoft.SqlServer.ServiceBrokerEnum ",
"Microsoft.SqlServer.ConnectionInfoExtended ",
"Microsoft.SqlServer.Management.Collector ",
"Microsoft.SqlServer.Management.CollectorEnum",
"Microsoft.SqlServer.Management.Dac",
"Microsoft.SqlServer.Management.DacEnum",
"Microsoft.SqlServer.Management.Utility"

foreach ($asm in $assemblylist)
{
    $asm = [Reflection.Assembly]::LoadWithPartialName($asm)
}

$prefix='MSSQL$'

$wmi = New-Object 'Microsoft.SqlServer.Management.Smo.Wmi.ManagedComputer' localhost

foreach ($instance in $wmi.ServerInstances){
    $port=1433
    $service="MSSQLServer"
    $tcp = $instance.ServerProtocols['Tcp']
    if ($instance.Name -eq "SCCM"){
        $port=1436
        $service=$prefix+$instance.Name
    }
    if ($instance.Name -eq "SP"){
        $port=1435
        $service=$prefix+$instance.Name
    }
    foreach ($IP in $tcp.IPAddresses){
        $IP.IPAddressProperties["Enabled"].Value=$true
        $IP.IPAddressProperties["TcpDynamicPorts"].Value=""
        $IP.IPAddressProperties["TcpPort"].Value=$port.ToString()
    }
    $tcp.Alter()
    restart-service -Name $service -Force
}