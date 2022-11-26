---
external help file: EC.IntroModule-help.xml
Module Name: EC.IntroModule
online version:
schema: 2.0.0
---

# Get-Cube

## SYNOPSIS
SE-UP example commandlet

## SYNTAX

```
Get-Cube [-Number] <Decimal[]> [<CommonParameters>]
```

## DESCRIPTION
SE-UP example commandlet that returns cube of a given number.

## EXAMPLES

### EXAMPLE 1
```
cube 2,3,4
```

Returns cubes of specified numbers

### EXAMPLE 2
```
2,3,4 | cube
```

Returns cubes of numbers passed via pipeline

## PARAMETERS

### -Number
Input number(s)

```yaml
Type: Decimal[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
