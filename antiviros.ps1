# Definição de diretórios para verificação
$directoryToScan = "C:\TestFolder"
$logFile = "C:\AntivirusLog.txt"

# Assinaturas simples para identificar arquivos suspeitos
$suspiciousSignatures = @(
    "malicious-code-pattern",
    "AnotherSuspectPattern"
)

# Extensões suspeitas
$suspiciousExtensions = @(".exe", ".bat", ".vbs", ".ps1")

# Função para verificar assinaturas em arquivos
Function Test-FileContent {
    param (
        [string]$filePath
    )
    $content = Get-Content -Path $filePath -ErrorAction SilentlyContinue
    foreach ($signature in $suspiciousSignatures) {
        if ($content -match $signature) {
            return $true
        }
    }
    return $false
}

# Log inicial
"Scanning directory: $directoryToScan" | Out-File -FilePath $logFile -Append

# Início da varredura
Get-ChildItem -Path $directoryToScan -Recurse | ForEach-Object {
    if ($_ -is [System.IO.FileInfo]) {
        $fileExtension = $_.Extension
        if ($suspiciousExtensions -contains $fileExtension) {
            "Suspicious file detected: $($_.FullName)" | Out-File -FilePath $logFile -Append
        } elseif (Test-FileContent -filePath $_.FullName) {
            "Malicious content detected in file: $($_.FullName)" | Out-File -FilePath $logFile -Append
        }
    }
}

# Conclusão
"Scan completed. Log saved to $logFile" | Out-File -FilePath $logFile -Append
