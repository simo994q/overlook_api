# Overlook API
API'et er bygget i NodeJS, Express og Sequelize. Det er bygget op mod en MySQL database som datakilde. I mappen *Data* finder du et mysql dump af databasen som du kan køre i jeres lokale database. 

Herunder ligger et link til en Postman dokumentation sim giver et overblik over de forskellige endpoints i API'et:
https://documenter.getpostman.com/view/6540576/2s9Y5SXRwU

## .env
Sørg for at indtaste dine bruger oplysninger til din database i filen `.env`.

Der kan du også angive portnummer og levetid i sekunder for dine tokens. Standard portnummer er 4000.

## Billeder
I mappen `images` finder du alle billeder til sitet. 

Disse kan kopieres til din frontend løsning.

I nogle endpoints får du kun filnavnet ud og du skal derfor selv indsætte stien i dataudtrækket. 

## Users, Usergroups & Organisations
API'et har en brugertabel med relationer til brugergrupper og organisationer. Som udgangspunkt kan du bare bruge brugertabellen til login men 

- **Organisations (*orgs*):** bruges til at oprette virksomheder, foreninger eller lignende. En bruger kan kun være medlem af en organisation.

- **Brugergrupper (*groups*):** bruges til at oprette forskellige grupper med. Disse kan bruges til til at at lave forskellige grupperinger af brugere. Eksempelvis kan man have en gruppe for admin brugere, webshopkunder eller modtagere af et nyhedsbrev. En bruger kan være medlem af mange grupper.

## Start API'et
Kør `nodemon .` i terminalen for at starte projektet. Databasen skal selvfølgelig være sat op før at API'et vil virke.