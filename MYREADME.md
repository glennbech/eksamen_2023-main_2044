Sensor måste göra följande
Oppgave 1:
-	Installea maven i cloud9 (om det används)
-	AWS Credentials – Skapa nya AWS nycklar  och lägga till dom som secrets i GitHub repository settings. 
    Detta inkluderar AWS_ACCESS_KEY_ID og AWS_SECRET_ACCESS_KEY.
-	Kör comman in the terminal från mappen /kjell där tamplate.yaml ligger: 
    CMD: sam deploy –stack-name your-stack-name –guided (Byt ut your-stack-name med ditt) 
    Efter du kört denna CMD skall du ha fått en samconfig.toml file.
-	Inne i  workflow filen ci.yaml behöver du ändra till ditt stack name(linje 63) och ECR repository name(linje 109). 

NB! Var obs på att S3 bucket inte inne håller filer som inte är jpg eller png. 

Oppgave 4:
-  Ändra namnet för cloudwatch namespace i filen: CloudWatchConfiguration.java linje 41.
-	Du behöver ändra i ci.yaml (linje 120, 121)
    IMAGE_IDENTIFIER: 244530008913.dkr.ecr.eu-west-1.amazonaws.com/<sporeb15-private>:latest
    PREFIX: <candidate2044> 
-	I infra/provider.tf (Ändra så att du har samma som prefix värden)
    backend "s3" {
        bucket = "pgr301-2021-terraform-state"
        key    = "candidate2044/apprunner-lab.state" # You chould change the candidate2044 to you own "name".
        region = "eu-north-1"
      }
- Ändra till din egen mail:
  I infra/variabels.tf variabeln alarm_mail (linje 56)

CMD föra att sätta en metrics i alarm kan du köra denna (glöm inte att ändra till ditt namespace) :
aws cloudwatch put-metric-data --namespace "<cloudwatch-candidate2044>" --metric-name "response_time" --value 3000 --unit Milliseconds

CMD för att tesat end-points.
mvn spring-boot:run

curl localhost:8080/scan-ppe?bucketName=kjellsimagebucket

curl -X GET http://localhost:8080/count-image
curl -X GET http://localhost:8080/total-violation
curl -X GET http://localhost:8080/avg-response-time


Oppgave 5. 

A.
Kontinuerlig konfiguration betyder i praktiken att alla utvecklares koder (som skrivs i deras egna bransch/”arbetskopia”) 
skall slås samman till huvud branschen (main), flera gånger om dagen (https://en.wikipedia.org/wiki/Continuous_integration). 
Innan en utvecklare i ett team kan pusha sin bransch(kod) till main. Bör den bli checkat och godkänd av en annan i teamet. 
Detta gör man för att man snabbare skall hitta eventuella fel i koden, eller för att förbättra koden innan den blir publicerad 
på huvud branschen. Detta är en av delarna i CI som förbättrar och effektiviserar utvecklingsprocessen. 
Automatisering är en annan del som också förbättrar och effektiviserar utvecklingsprocessen. Github Actions är ett automatiserings 
verktyg som gör den börjar med att bygga och testa koden varje gång ny eller förbättrad kod blir pushet till teamets repository.
Detta gör att utvecklarna får reda på med en gång om det är något fel i koden som då  måste ändras.

När jag och andra med studenter jobbade med ett examen projekt i Smidig, använde vi oss av Github och Github Actions för kontinuerlig 
konfiguration. 
Vi alla jobbade i vår egna bransch, ingen fick skriva kod direkt i main branschen. Då detta kan snabbt skapa konflikter. 

Det är också smart att heller push upp små ändringar i koden än stora när man jobbar i sin egen bransch. Detta gör det enklare att hitta 
fel som gjorts i koden eller att enkelt gå tillbaka till en specifik ”stadie” i koden. Men när man är helt klar med sin del av koden kan 
man göra en så kallad pull request. Detta gör man när man vill slå samman sin branschen med main. 

Vi hade några tester som alltid körde när man gjort en pull request, så om testerna var godkända, var nästa steg att få en annan i 
teamet att göra en code review. Detta gör man för att säkra sig en bra kod kvalitet. Detta märket vi ganska fort att det var viktigt 
då en i teamet hade ändrat hela kod strukturen för att få ett par tester att funka. Vilket i sin tur hade förstört resten av koderna som 
var byggt på den strukturen vi valt. Om vi inte hade haft ett krav på att minst 2 stycken i teamet måste godkänna koden först.
Men om koden var godkänd av andra team medlemmar var nästa steg att slå samman branschen med main branschen.

Därefter raderade man den ”gamla” branschen man jobbat i och skapat en ny för nästa kod som hen skulle skriva. Och allting måste gå 
igenom samma flyt igen.

B.
1. Scrum/Smidig Metodik
Agile Scrum-metodik är ett projektledningssystem som är baserat på inkrementell/stegvis utveckling. Varje iteration kan bestå av två 
till fyra veckor långa sprits. Före varje sprint bestämmer man sprint mål, alltså det teamet skall få gjort under dessa veckorna. 
Varje sprint mål är att klara att få gjort det viktigaste funktionerna under den sprinten. För att så småningom komma fram till en 
potential leveransbar produkt (https://www.inflectra.com/Methodologies/Scrum.aspx#:~:text=Agile%20scrum%20methodology%20is%20a,with%20a%20Potentially%20Shippable%20Product.).

Scrum används för att få gjort arbete i små delar åt gången. Där man genom hela vägen ger feedback för att lära och förbättra allt eftersom. 
Scrum är också en bra metod för team att ständigt förbättra samarbetet med varandra. 

När jag jobbade med scrum i ett projekt började vi första med att möta hela teamet där vi kunde diskutera vad som är det viktigaste 
funktionerna för denna sprinten. Om det fans några oenigheter så var det scrum masterna som tag beslutet. Scrum masterna är han som är 
ledaren över teamet. När alla mål var satta, blev var och en i teamet satt på en specifik uppgift eller fler. När alla funktioner 
var klara, alltså all kod för den sprinten var gjort, skall applikationen testas för att se om det vi gjort funkar som det skulle. 

Vi hade också något som kallas för en sprint review där vi gick igenom hur vi tyckte veckan hade gått och vad som vi tyckte vad 
bra/dåligt. Vi bestämde också för vad vi tyckte behövde förbättra eller förändra inför näst kommande sprint. Detta gjorde att vi i 
teamet kommer närmare varandra och samt förbättrade vårt samarbete med varandra. Vilket är en av fördelarna med scrum, andra fördelar 
är snabb leverans av en produkt, flexibilitet och anpassbart. 

Det negativa med scrum är bland annat att det fort kan se att man bygger funktioner som inte kommer att behövas, detta var något jag 
märkte av i vårt scrum projekt. Att feedback inte kans ges förens i slutet av sprinten och man vet inte om systemet är stabilt förens 
i slutet (https://www.inflectra.com/Methodologies/Scrum.aspx#:~:text=Agile%20scrum%20methodology%20is%20a,with%20a%20Potentially%20Shippable%20Product.).

2. DevOps metodik
DevOps är en metod som integrerar och automatiserar arbetet med mjukvaruutveckling (Dev) och IT-drif (Ops) som är ett sätt att förbättra 
och förkorta livscykeln för systemutveckling (https://en.wikipedia.org/wiki/DevOps).
Man kan också förklara DevOps genom att människor samarbetar tillsammans för att skapa, bygga och leverera säker programvara i högsta hastighet. 
DevOps möjliggör mjukvaruutveckling och drift att snabba på leveransen genom automatisering, samarbete, snabb feedback och iterativ förbättring. 
DevOps uppmuntrar för en bättre sammarbetsmiljön i alla händelser av utveckling cykeln. DevOps skall hjälpa till att skapa en kultur av 
ansvarighet, förbättra teamwork, empati och ett gemensamt ansvar för affärsresultat (https://about.gitlab.com/topics/devops/#overview).

Exempel på utmaning med att gå över till en DevOps modell är att bestämma vilka mått(metrics) som är mest givande för en organisation eller 
att använda sig av microtjänster i DevOps kan göra det svårare att hantera flera oberoende distribuerande tjänstekomponenter, som  till exempel 
felsöka problem och att säkerställa att hela systemet fungerar korrekt. En annan utmaning med DevOps är att hantera förändringar, då 
detta kräver en snabb implementering. Att byta ett system innebär också nya risker och sårbarheter (https://sematext.com/blog/devops-challenges/).

3. Sammenligning och kontrast:
När man skall jämföra scrum och DevOps metodik i förhållande till deras påverkan på programvarukvalitet och leveranstempo, menar jag att båda 
metodikernas syfte är att förbättra kvaliteten och tempot men på olika sätt. Scrum handlar mycket om hur man jobbar, hur och vad kan man 
göra för förbättringar samt förändringar för att komma i mål. Men i DevOps handlar det om integrerar/slå samman utveckling med operativa 
processer som man kan göra med programmet Github. 

När det kommer till att välja metodik beror det såklart på organisations mål, vilka kompetenser som finns i teamet, storlek på teamet, kundens 
framförhållning och förväntningar. Till exempel om det är ett helt nytt team som aldrig jobbat med varandra kan scrum vara en väldigt fin 
metodik för att finna ett bra teamwork som passar för alla i teamet. Samt snabbt få fram vad som funkar och inte funkar när det kommer till 
hur teamet jobbar. Det kan också vara bra för att se vilka styrkor som teamet har och hur dem borde fördela arbetet. 
Men scrum är en metodik som inte passar lika bra på ett team som är väldigt stora. Då kan DevOps vara ett bättre val, där fokusen 
ligger på att kontinuerligt intrigerar utvecklingen och man snabbt kan lösa de kod 
problemen som man stöter på. Om man har en kund som önskar en ständig uppdatering på resultatet så är scrum en passande metodik 
eftersom målet vid varje sprint är en fungerande applikation. Det gör det enkelt för teamet att visa upp något för kunden.

Men egentligen skulle jag vilja säga att en blandning av båda metodikerna hade varit bäst, då man både vill ha ett fungerande samarbete 
och en ständigt analysering på vad som fungerar samt vad som måste förbättras i teamet. Men man önskar också att ge snabb feedback 
och finna felen och rätta till dem fort. 

C.
Om jag skulle implementera en ny funktionalitet i en applikation jag jobbar med skulle jag använda Github där jag skulle ställa in 
inställningar som gör att det är ett krav att en eller flera måste godkänna koden innan den kan flätas samman med main branschen. 
Feedback från andra vill bidra till ständigt lärande från andra som kanske har mer erfarenheter eller andra kunskaper. 
Detta vill också göra att teamet utvecklas och att man lyfter varandra framåt. Jag skulle också valt att använda Github Actions 
flyt som bygger och testar applikationen varje gång man pushar upp nya eller förändrade funktioner. Detta gör att man hittar problem 
direkt när det uppstår så att det inte kan skapa större problem framöver. 

Feedback är en viktigt bit i alla faser av en utvecklingscykel, det är feedback som gör att ett produkt blir bättre. Redan från 
planeringsfasen kan man börja få feedback genom olika undersökningar och survey för att få ett större eller ett annat perspektiv om idén. 
Det kan också bidra till nya eller förändrade krav på applikationen. 

I design fasen kan man implementera feedback genom användartester på applikationens prototyp, detta är nödvändigt då logiken man tänk 
kanske inte är lika logisk för någon annan. Genom användartester får man också viktigt information från eventuellt framtida användare. 

Under utvecklingsfasen är Github ett perfekt verktyg för att få feedback från andra utvecklare samt testa applikationen under tiden 
man utvecklar. Under testfasen kan man använda sig av olika typer av testning ett exempel är A/B testning. I A/B testning jämför man 
två olika variationer av applikationen för att se vilken som presterar bäst. Vid distributionsfasen kan man få in feedback genom att 
övervaka användaradoption som till exempel se på användarstatistik, gör kundundersökningar och se på problemrapporter.  
