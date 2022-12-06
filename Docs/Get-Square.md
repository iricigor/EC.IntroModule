---
external help file: EC.IntroModule-help.xml
Module Name: EC.IntroModule
online version:
schema: 2.0.0
---

# Get-Square

## SYNOPSIS
Enterprise Cloud example commandlet

## SYNTAX

```
Get-Square [-Number] <Decimal[]> [<CommonParameters>]
```

## DESCRIPTION
Enterprise Cloud example commandlet that returns square of given number(s)

## EXAMPLES

### EXAMPLE 1
```
square 2,3,4
```

Returns square of specified numbers

### EXAMPLE 2
```
2,3,4 | square
```

Returns squares of numbers passed via pipeline

## PARAMETERS

### -Number
Input number(s)

```yaml
Type: Decimal[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
