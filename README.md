# SDETTest Projects API

This is a REST based web service designed to handle GET/POST requests using an api built using Ruby on Rails and PostgreSQL.

## Setup & Dependencies
Ruby, Rails, and PostgreSQL are required for this project
1. Clone the repo
2. Run `bundle install` to install ruby gems
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
One of the most interesting parts of this project is how it handles and parses incoming project data. I assumed all incoming data would conform to the example given in the challenge guidelines. In order for the incoming data to pass my validations, I need to tweak it a little bit.

For example, I create a boolean validation for the enabled key as a project should only ever be enabled or not enabled. However, that key is passed in as a string. I found some logic that will parse any string into a true or false boolean accepting a wide range of truthy or falsey values.

I also have to convert the incoming creationdDate and expiryDate string into a Ruby formatted date to comply with my model and database level date validation. To do this, I use Ruby's Date#strptime method which uses a regex to convert an incorrectly formatted date string into a format accepted by Ruby's Date object.

Finally I have to correctly set up the many-to-many relationships between projects and their countries and keys. For countries, I simply iterate through an incoming project's countries and attempt to save them to the database. Duplicate countries won't save thanks to my validations. After I save them, I add the country to my project's association and the join table relationship will get created and tested when the project saves. The keys work the same way except I added additional logic to check to make sure invalid key pairs wouldn't allow a project to be save. For instance, if the database already has the key { 24 "hats" } and I try to save the key { 24 "shoes" }, The project will get a validation error and not save correctly.

All of this logic can be found on the ProjectsController at `app/controllers/projects_controller.rb`

## Search

My searching logic can be found on the Project model at `app/models/project.rb`.

The logic of my search is fairly straightforward. I begin by checking if projectid is included in the incoming params. If it is, I override all search requirements and simply return that project if it exists.

After that check, I create a joins table of all my data filtering out expired and disabled projects.

## Potential Improvements

When parsing incoming data, I believe I make unnecessary queries to the database when I try to save countries or keys that already exist. I can avoid these extra calls to my database by using a cache that remembers what countries and keys have already been saved and then not try to save those again.

I trusted my validations to handle the testing saving projects of different formats but I think I would benefit from writing more Postman tests that create different kinds of both valid/invalid projects.

I would also like to go back and write more descriptive error messages for my model level validations. Currently, if you try to save a duplicate key the error will only be "Key is invalid" rather than "Key 24 is invalid". I had some difficulty interpolating the error value into the message and was forced to move on.
