<#
    menu
#>


function Show-JVMenu {
    [CmdletBinding()]
    param(    
        [string]$Titulo,
        [string[]]$OpcoesMenu 
    )

    $Separador = "*" * 47

    Clear-Host
    Write-Verbose -Message "A inicializar o menu..."
    Write-Host $Separador
    Write-Host "$Titulo"
    Write-Host $Separador
    ForEach($opcao in $OpcoesMenu){
        Write-Host " $opcao"
    }
    Write-Verbose -Message "O menu foi apresentado..."
}
   function Start-JVMenu {
    [CmdletBinding()]
    param()
    do {
        Show-JVMenu -Titulo "Menu Principal" -OpcoesMenu @(
            "1 - Visualizar a data",
            "2 - Visualizar o conteúdo do diretório atual",
            "S - Sair "    
        )
        $opcao = Read-Host "Selecione uma opçaõ de menu"
        switch ($opcao) {
            '1' {
                Write-Host "Opção 1"
                Start-Sleep -Seconds 2
            }
            '2' {
                Write-Host "Opção 2"
                Start-Sleep -Seconds 2
            }
            'S'{
                Write-Host "Dja bu bai"
                Start-Sleep -Seconds 2
            }
        
            Default {
                Write-Host "Opção inválida"
                Start-Sleep -Seconds 2
            }
        }    
    } while($opcao -ne "S")
}

Start-JVMenu -Verbose