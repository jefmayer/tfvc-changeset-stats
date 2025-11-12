# Define the two changesets to compare
param(
    [Parameter(Mandatory = $true)]
    [int]$ChangesetId1,

    [Parameter(Mandatory = $true)]
    [int]$ChangesetId2
)

# "." means current directory (must be in a mapped workspace)
$diff = tf diff . /version:"C$($ChangesetId1)~C$($ChangesetId2)" /recursive /format:unified 2>$null

# Count lines that start with '+' or '-'
# Skip diff headers ("+++","---") so we only count actual code changes
$added    = ($diff | Select-String '^[+][^+]' | Measure-Object).Count
$removed  = ($diff | Select-String '^[-][^-]' | Measure-Object).Count

# Optional: Count how many files were touched
$files    = ($diff | Select-String '^Index: ' | Measure-Object).Count

Write-Host "Changeset: $ChangesetId1"
Write-Host "Files changed: $files"
Write-Host "Lines added:  $added"
Write-Host "Lines removed: $removed"
Write-Host "Net change:   $($added - $removed)"
