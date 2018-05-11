# Dokumentáció

## A szerződésben tárolt adatok, és a szerződés létrehozása

A szavazás létrehozásakor a szerződésben mentésre kerül a PDF-re mutató link (`matter_link`), annak hash-e (`matter_hash`), a szavazás határideje (`hatarido`), valamint a tulajdonos címe (`rendezo`) (mivel később csak ő vehet fel résztvevőket). Ezek közül a PDF-hez tartozó adatok, valamint a határidő publikus, bárki számára elérhető.

A szavazók tárolásához létrehoztunk egy Voter struktúrát, ami tárolja egy adott címhez, hogy az szavazásra jogosult, illetve hogy szavazott-e.

A szavazatok könnyű adminisztrálása érdekében külön számon tartjuk a szavazatra jogosultak, az igen szavazatok és a teljesség kedvéért a nem szavazatok számát.

A szavazás létrehozásának feltétele, hogy a határidő jövőbeli időpont legyen.

## Új résztvevő felvétele

Új résztvevő felvételekor ellenőrizzük, hogy a határidő előtt vagyunk, hogy a felvételt a szavazás tulajdonosa intézi, illetve hogy a felvenni kívánt résztvevő nincs még a szavazók közt.

Amennyiben a feltételeknek megfelel a tranzakció, úgy a felvenni kívánt személy címét felvesszük a regisztráltak közé (a címhez tartozó Voter struktúra `registered` mezőjét `true`-ra állítjuk), és a résztvevők számát (`numberOfVoters`) növeljük 1-gyel.

## Szavazás

Szavazáskor ellenőrizzük, hogy a határidő nem járt le, a küldő jogosult a szavazásra és nem szavazott.
Ha ezen feltételeknek megfelel, akkor könyvelésre kerül a szavazata: igen/nem (yesVotes/noVotes növelése 1-gyel), illetve szavazott-ra (`true`) állítjuk a küldő címéhez tartozó Voter struktúra `voted` mezőjét, hogy többször ne tudjon szavazni.

## Eredmény lekérdezése

A határidő lejárta után, visszaadja hogy a szavazásra jogosultak legalább fele igennel szavazott-e.

# Tesztelés

...



