This app was build using webpack and vue.js

It is deployed at https://celmatix-challenge-tomfbiz.herokuapp.com/
The code is at https://github.com/tomfbiz/celmatix-challenge

The development environment requires 
* ruby 2.3.1
* rails 5.1.4
* node 6.11.2
* yarn

To install prerequisits:

   rvm install 2.3.5
   rvm use 2.3.5
   nvm install 6.11.2
   nvm use 6.11.2
   brew install yarn


Configuration:
"secret" ENV settings (set in application.yml in development, and via commandline in Heroku or AWS)
* SENDGRID_PASSWORD
* SENDGRID_USERNAME


To load the products from JSON run the following rake tast:
* rake data:load_products

# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
