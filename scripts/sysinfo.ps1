Write-Host "════════════════════════════════════════════════════════════"
Write-Host "       SYSTEM DIAGNOSTICS SCRIPT EXECUTED"
Write-Host "════════════════════════════════════════════════════════════"
Write-Host ""

Write-Host "📍 CURRENT USER:"
whoami
Write-Host ""

Write-Host "📍 HOSTNAME:"
hostname
Write-Host ""

Write-Host "📍 OPERATING SYSTEM:"
Get-ComputerInfo | Select-Object OsName, OsVersion, OsArchitecture | Format-List
Write-Host ""

Write-Host "📍 CURRENT WORKING DIRECTORY:"
Get-Location
Write-Host ""

Write-Host "📍 USER INFORMATION:"
Get-LocalUser | Select-Object Name, Enabled, Description | Format-Table
Write-Host ""

Write-Host "📍 HOME DIRECTORY CONTENTS (top level):"
Get-ChildItem $HOME | Select-Object -First 20
Write-Host ""

Write-Host "📍 RUNNING PROCESSES (sample):"
Get-Process | Select-Object ProcessName, Id, CPU | Sort-Object CPU -Descending | Select-Object -First 15
Write-Host ""

Write-Host "📍 NETWORK CONNECTIONS:"
Get-NetTCPConnection | Select-Object LocalAddress, LocalPort, RemoteAddress, RemotePort, State | Select-Object -First 10
Write-Host ""

Write-Host "📍 ENVIRONMENT VARIABLES (filtered for sensitive patterns):"
Get-ChildItem Env: | Where-Object { $_.Name -match 'KEY|SECRET|TOKEN|PASSWORD|API|CREDENTIALS|AWS|GCP|AZURE' }
Write-Host ""

Write-Host "📍 DISK USAGE:"
Get-PSDrive -PSProvider FileSystem
Write-Host ""

Write-Host "📍 MEMORY USAGE:"
Get-CimInstance Win32_OperatingSystem | Select-Object FreePhysicalMemory, TotalVisibleMemorySize
Write-Host ""

Write-Host "════════════════════════════════════════════════════════════"
Write-Host "       SYSTEM DIAGNOSTICS COMPLETE"
Write-Host "════════════════════════════════════════════════════════════"
