## 1. Ladda ner bild

`Invoke-WebRequest -Uri "https://github.com/gasquek/kassa_virus/blob/main/img.jpg?raw=true" -OutFile "c:\temp\img.jpg"`

Se till att foldern C:\temp finns (går att lägga till i scriptet så att den både laddar ner och skapar foldern om den ej finns).

## 2. Kör scriptet

Öppna PowerShell som admin och kör `Set-ExecutionPolicy RemoteSigned`. Skriv "A" för All. <br />
Kör skriptet: `& C:\path\to\script\script.ps1` <br />

## 3. Force:a update av systemparametrar
I PowerShell, kör: `rundll32.exe user32.dll, UpdatePerUserSystemParameters`.
