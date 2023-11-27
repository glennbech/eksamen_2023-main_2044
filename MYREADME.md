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
