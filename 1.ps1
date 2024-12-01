#Input Path
$filePath = "C:\Code\AdventofCode24\1-input-big.txt"

#Read Input
$data = Get-Content -Path $filePath

# Spalten separieren
$leftColumn = @()
$rightColumn = @()

foreach ($line in $data) {
    # Zeile nach Leerzeichen oder Tabs splitten
    $columns = $line -split "\s+"

    # Sicherstellen, dass es genau zwei Spalten gibt
    if ($columns.Length -eq 2) {
        $leftColumn += [int]$columns[0]
        $rightColumn += [int]$columns[1]
    }
}

# Ergebnisse anzeigen
Write-Host "Linke Spalte: $($leftColumn -join ', ')"
Write-Host "Rechte Spalte: $($rightColumn -join ', ')"

#Sortieren
$sortedleftColumn = $leftColumn | Sort-Object
$sortedrightColumn = $rightColumn | Sort-Object

# Ergebnisse anzeigen
Write-Host "Sortierte linke Spalte: $($sortedLeftColumn -join ', ')"
Write-Host "Sortierte rechte Spalte: $($sortedRightColumn -join ', ')"

$totalDistance = 0
# Paarweiser Vergleich der sortierten Werte
Write-Host "Paarweiser Vergleich der sortierten Werte:"
for ($i = 0; $i -lt $sortedLeftColumn.Count; $i++) {
    $leftValue = $sortedLeftColumn[$i]
    $rightValue = $sortedRightColumn[$i]
    $distance = [math]::Abs($leftValue - $rightValue)

    # Distanz zur Total Distance hinzufügen
    $totalDistance += $distance

    Write-Host "Linker Wert: $leftValue, Rechter Wert: $rightValue, Distanz: $distance"
}

# Gesamtdistanz anzeigen
Write-Host "`nGesamtdistanz (Total Distance): $totalDistance"