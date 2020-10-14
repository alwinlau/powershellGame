#This script will generate a random number between 1-100 and allow the user to guess the number

function Write-HostCenter { param($Message) Write-Host ("{0}{1}" -f (' ' * (([Math]::Max(0, $Host.UI.RawUI.BufferSize.Width / 2) - [Math]::Floor($Message.Length / 2)))), $Message) }

function Show-Menu {
    param(
        [string]$title = 'What is YOUR number'
    )

    Clear-Host
    Write-Host ""
    Write-Host ""
    Write-Host ""
    Write-Host ""
    Write-Hostcenter "*-*-*-*-* $Title *-*-*-*-*" 
    Write-Host "" 
    Write-Hostcenter "The computer will generate a random number between 1-100" 
    Write-Host "" 
    Write-Hostcenter "You will try to guess that random number"
    Write-Host ""
    Write-Hostcenter "The game will end once you guess the correct number"
    Write-Host ""
    Write-Host ""
    Pause
}

function Guess {
    [int]$count = 0
    $rand = New-Object system.random
    $random = $rand.next(1,101)
    Show-Menu
    do
    {
        Clear-Host
        Write-Host ""
        [int]$selection = Read-Host "Please enter a number between 1 to 100"
        Write-Host ""
        if (($selection -lt 1) -or ($selection -gt 100))
        {
            Write-Host "YOUR number must be between 1-100"
            $count++
            pause
        }
        if (($selection -gt $random) -and ($selection -le 100))
        {
            Write-Host "YOUR number is lower" -ForegroundColor Red
            $count++
            pause
        }
        if (($selection -lt $random) -and ($selection -ge 1))
        {
            Write-Host "YOUR number is greater" -ForegroundColor Yellow
            $count++
            pause
        }
        if ($selection -eq $random)
        {
            $count++
            Clear-Host
            Write-Host ""
            Write-Host ""
            Write-Host ""
            Write-Hostcenter "YOUR number was $random"
            Write-Hostcenter "YOU took $count tries to get the correct number"
            Write-Host ""
            pause
        }
    }
    until ($selection -eq $random)

    Clear-Host
    Write-Host "Would you like to play again?"
    $play = Read-Host "Press Y for yes and N for no"
    if ($play -eq "Y")
    {
        Guess
    }
    if ($play -eq "N")
    {
        Clear-Host
        return
    }
    if (($play -ne "Y") -or ($play -ne "N"))
    {
        Write-Host "Please enter Y or N"
    }
}

Guess   