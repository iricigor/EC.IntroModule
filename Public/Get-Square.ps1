function Get-Square {

    param (
        [Parameter(Mandatory=$true,ValueFromPipeline=$true)]
        [decimal[]]$Number
    )

    BEGIN {
        Write-Verbose "begin $($Number.Count) elements"
    }

    PROCESS {
        Write-Verbose "process $($Number.Count) elements"
        foreach ($N in $Number) {
            Write-Verbose 'calculating'
            $N * $N
        }
    }

    END {
        Write-Verbose "end $($Number.Count) elements"
    }

}
