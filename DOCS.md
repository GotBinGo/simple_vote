# Dokumentáció

## A szerződésben tárolt adatok

A szavazás létrehozásakor a szerződésben mentésre kerül a PDF-re mutató link (`matter_link`), annak hash-e (`matter_hash`), a szavazás határideje (`hatarido`), valamint a tulajdonos címe (`rendezo`) (mivel később csak ő vehet fel résztvevőket).

A szavazók tárolásához létrehoztunk egy Voter struktúrát, ami tárolja egy adott címhez, hogy az szavazásra jogosult, illetve hogy szavazott-e.

A szavazatok könnyű adminisztrálása érdekében külön számon tartjuk a szavazatra jogosultak, az igen szavazatok és a teljesség kedvéért a nem szavazatok számát.

## Új résztvevő felvétele

Új résztvevő felvételekor ellenőrizzük, hogy a felvételt a szavazás tulajdonosa intézi, illetve hogy a felvenni kívánt résztvevő nincs még a szavazók közt.

## Szavazás

Szavazáskor ellenőrizzük, hogy a határidő nem járt le, a küldő jogosult a szavazásra és nem szavazott.
Ha ezen feltételeknek megfelel, akkor könyvelésre kerül a szavazata (igen/nem, illetve szavazott-ra állítjuk a küldőhöz tartozó flaget, hogy többször ne tudjon szavazni)

## Eredmény lekérdezése

A határidő lejárta után, visszaadja hogy a szavazásra jogosultak legalább fele igennel szavazott-e.

# Tesztelés

...



