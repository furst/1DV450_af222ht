# Instruktioner

* Kör "bundle install" på bade toerh provider och toerh client
* Migrera databaserna och kör rake db:seed på båda applikationerna
* Kör sedan igång båda applikationera med hjälp av "rails s -p 3000"(toerh provider) och "rails s -p 3001"(toerh client).
* Gå in på localhost:3000/oauth/applications och skapa en ny applikation med valfritt namn och en callback url till http://localhost:3001/auth/toerh/callback
* Gå in i koden till "toerh client" och klistra in koderna du får under config/initializers/omniauth.rb
* Starta om servern till toerh client(3001)
* Gå till localhost:3001 och skapa ett konto(här finns även docsen)
* Ta auth_token du fått vid inloggning och stoppa i angularapplikationen under src/app.js.
* Kör igång angular-appen. Logga in med oauth genom att klicka uppe i högra hörnet, inloggningen är "test@test.se" och "abc123"

Nu är de bara att köra!
