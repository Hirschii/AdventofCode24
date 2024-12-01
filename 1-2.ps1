# Input Path
$filePath = "C:\Code\AdventofCode24\1-input-big.txt"

# Read Input
$data = Get-Content -Path $filePath

# Initialize arrays to store the left and right columns
$leftColumn = @()
$rightColumn = @()

foreach ($line in $data) {
    # Split the line by whitespace or tabs
    $columns = $line -split "\s+"

    # Ensure there are exactly two columns
    if ($columns.Length -eq 2) {
        $leftColumn += [int]$columns[0]
        $rightColumn += [int]$columns[1]
    }
}

# Initialize a variable to store the total similarity score
$totalScore = 0

# Loop through each number in the left column
foreach ($leftNumber in $leftColumn) {
    # Count how many times the current number in the left column appears in the right column
    $countInRightColumn = ($rightColumn | Where-Object { $_ -eq $leftNumber }).Count
    
    # Calculate the contribution to the total score for this number
    $totalScore += $leftNumber * $countInRightColumn
}

# Output the total similarity score
Write-Output "Total Similarity Score: $totalScore"