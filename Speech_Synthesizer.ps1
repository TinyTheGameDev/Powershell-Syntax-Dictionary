#Reference: https://community.spiceworks.com/topic/813513-powershell-script-to-send-a-message-with-sound-to-remote-users
#Found while looking for a way to send a multi-prompt popup box to remote users

Add-Type -AssemblyName System.speech
$speak = New-Object System.Speech.Synthesis.SpeechSynthesizer
$speak.Rate = -2

$phrase = @("I'm a robot.",
           "Help, I'm stuck in your computer!",
           "What are you doing, $env:username") |Get-Random

Write-Output $phrase

$speak.Speak($phrase)