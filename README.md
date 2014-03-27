#Instruktioner

OBS! Inloggning fungerar ej, inte heller går det att spara, uppdatera och ta bort resurser. Cors funkar inte för tillfället. Men att titta på resurser går!

Kör "bundle install" på bade toerh provider och toerh client

Kör sedan igång både dom separat med hjälp av "rails s -p 3000" och "rails s -p 3001".
toerh client ska ha 3001 och toerh provider ska ha 3000.

Migrera databaserna och kör rake db:seed på båda applikationerna.

Gå till toerh client(localhost:3001) och skapa ett konto. Här finns även docsen.
Ta auth_token du fått vid inloggning och stoppa i angularapplikationen under src/app.js.

Nu är de bara att köra!
