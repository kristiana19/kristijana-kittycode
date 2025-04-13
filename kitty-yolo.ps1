Write-Host ""

# Ispis slatke Hello Kitty poruke u ljubičastoj boji
Write-Host "Hello Kitty is preparing your YOLO moment..." -ForegroundColor Magenta

Write-Host ""

# ASCII art Hello Kitty mačkice u ljubičastoj boji
Write-Host @"
 /\_/\  
( o.o )  Hello Kitty
 > ^ < 
"@ -ForegroundColor Magenta

# Provjerava da li se nalazi u Git repozitorijumu (da li postoji .git folder)
if (!(Test-Path ".git")) {
    Write-Host "Ovo nije Git repozitorijum. Idi u svoj projekat!" -ForegroundColor Red
    exit  # Ako nije – prekida se izvršavanje skripte
}

# Uzimanje trenutnog vremena i datuma u formatu yyyy-MM-dd HH:mm:ss
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

# Dodaje novu liniju u fajl yolo.txt (ili ga kreira ako ne postoji)
Add-Content -Path "yolo.txt" -Value "YOLO $timestamp"

# Dodaje fajl u staging area za commit
Write-Host "Dodajem fajl..." -ForegroundColor Cyan
git add yolo.txt

# Pravi commit sa porukom
Write-Host "Komitujem promenu..." -ForegroundColor Cyan
git commit -m "YOLO commit by Hello Kitty"

# Dobija ime trenutne grane (main)
$branch = git rev-parse --abbrev-ref HEAD

# Prikazuje ime grane
Write-Host "Tvoja grana je: $branch" -ForegroundColor Yellow

# Radi force push na tu granu – YOLO style!
Write-Host "YOLO push to $branch" -ForegroundColor Green
git push origin $branch --force

# Završna poruka
Write-Host ""
Write-Host "Gotovo! Refreshuj GitHub profil i sačekaj YOLO bedž!" -ForegroundColor Magenta
Write-Host ""
