function Get-Cube {
    
    param (
        [Parameter(Mandatory=$true,ValueFromPipeline=$true)]
        [int[]]$Number
    )
    
    BEGIN {
        Write-Verbose "begin $($Number.Count) elements"
    }
    
    PROCESS {
        Write-Verbose "process $($Number.Count) elements"
        foreach ($N in $Number) {
            Write-Verbose 'calculating'
            $N * $N * $N
        }
    }
    
    END {
        Write-Verbose "end $($Number.Count) elements"
    }
    
    }
    
    Set-Alias cube Get-Cube