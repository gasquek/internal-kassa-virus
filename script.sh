Invoke-WebRequest -Uri "https://github.com/gasquek/kassa_virus/blob/main/img.jpg?raw=true" -OutFile "img.jpg"

set-itemproperty -path "img.jpg" -name WallPaper -value img.jpg
