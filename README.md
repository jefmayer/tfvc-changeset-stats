# TFVC Changeset Stats

A small PowerShell utility that calculates the total number of lines **added**, **removed**, and **changed** between two Team Foundation Version Control (TFVC) changesets — something Azure DevOps / TFVC doesn’t provide natively (unlike GitHub’s diff summaries).

## Why

While Git repos and pull requests show diff stats automatically (`+123 −45`), TFVC changesets don’t expose this information.  
This script fills that gap by using `tf diff` under the hood and parsing the results to show (for example):

  ```Files changed: 8
  Lines added: 312
  Lines removed: 74
  Net change: +238
  ```

## Usage

1. Make sure you have **Visual Studio** installed with the **TFVC command-line tools** (`tf.exe`).
2. Open a PowerShell window **inside a mapped workspace** — this is important.  
   TFVC must know which server path your local directory maps to. (alternatively, if you are less lazy than me, you can add a param to this script to accept a workspace path)
3. Run the script:

   ```powershell
   .\Get-TfvcChangeStats.ps1 -ChangesetId1 12345 -ChangesetId2 12400
   ```

