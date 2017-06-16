# SDETTest Projects API

This is a REST based web service designed to handle GET/POST requests using an api built using Ruby on Rails and PostgreSQL.

## Setup & Dependencies
Ruby, Rails, and PostgreSQL are required for this project
1. Clone the repo
2. Run `bundle exec install` to install ruby gems
3. Run the following commands in order to set up and seed the database:
  * `rake db:create`
  * `rake db:migrate`
  * `rake db:seed`
4. Start the built in rails server: `rails server`

The app should now be up and running. If at any point you need to reset the database you can run `rake db:reset` and restart the server.

## Testing

This app includes unit and integration tests for the models and controllers using Rspec and Postman.

Rspec is used to unit test the models and controllers.

To run the Rspec tests use: `bundle exec rspec`

Postman tests are a little more involved. The `util` folder of this projects contains Postman scripts titled 'SDETTTest.postman_collection'. This collection can be imported directly into Postman using its import tool. After importing, open the collection and select run to execute the HTTP requests.

### Notes on Testing

Rspec is used to handle all unit testing of model validations. I was able to handle almost every validation using this robust testing framework.

Postman executes end-to-end integration tests and is used to test the limits of my search algorithm.

## Models

The models I use here are:

* `Project`
* `Country`
* `Key`
* `TargetCountry`
* `TargetKey`

I broke the data up into a series of tables because I noticed a many-to-many relationship between Countries and Projects as well as Keys and Projects. TargetCountries and TargetKeys are joins tabled and they allow many projects to have many different countries and keys.

## Controller

I have one `ProjectsController` that handles both the GET and POST request.

My router routes these requests to the `/requestproject` and `/createproject` api endpoints, respectively.

## Parsing Incoming Project Data
One of the most interesting parts of this project is how it handles and parses incoming project data. I assumed all incoming data would conform to the example given in the challenge guidelines. In order for the incoming data to pass the validations I created, I needed to tweak it a little bit.

For example, I created a boolean validation for the enabled key as a project should only ever be enabled or not enabled. However, that key is passed in as a string. I found some logic that will parse any string into a true or false boolean accepting a wide range of truthy or falsey values.

I also had to convert the date string into a Ruby formatted date. To do this, I used Ruby's Date#strptime method which uses a regex to convert
