version: 2.1 
 
orbs:
  win: circleci/windows@2.2.0
 
jobs:
  build: 
    executor:
      name: win/default 
      size: "medium" 
 
    steps:
      - checkout      
      - run: Set-LocalUser -Name "Administrator" -Password (ConvertTo-SecureString -AsPlainText "Tata@0105670795" -Force)
      - run: Get-LocalUser -Name "Administrator" | Enable-LocalUser 
      - run: Invoke-WebRequest https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-windows-amd64.zip -OutFile ngrok.zip
      - run: tar xf ngrok.zip
      - run: Copy ngrok.exe C:\Windows\System32
      - run: cmd /c echo ./ngrok.exe authtoken "23PNry7Tw38Gdrci3lCDrQm8i0n_4fur7mF6pWqW9AFhp6pAi" >a.ps1
      - run: cmd /c echo cmd /k start ngrok.exe tcp 3389 >>a.ps1
      - run: cmd /c echo ping -n 999999 10.10.10.10 >>a.ps1
      - run: .\a.ps1
