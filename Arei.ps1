ForEach-Object

$nomes = @("Rui","Roberto","Pedro")
$nomesModificados = $nomes | ForEach-Object{
    "Sr.$_"
}
$nomesModificados