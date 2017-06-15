# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

brazil = Country.create(
  id: 1,
  name: "BRAZIL"
)
canada = Country.create(
  id: 2,
  name: "CANADA"
)
mexico = Country.create(
  id: 3,
  name: "MEXICO"
)
usa = Country.create(
  id: 4,
  name: "USA"
)
germany = Country.create(
  id: 5,
  name: "GERMANY"
)

k25 = Key.create(
  id: 25,
  number: 25,
  keyword: "movie"
)
k30 = Key.create(
  id: 30,
  number: 30,
  keyword: "sports"
)
k17 = Key.create(
  id: 17,
  number: 17,
  keyword: "science"
)

p1 = Project.create(
  id: 1,
  project_name: "test project number 1",
  creation_date: DateTime.now,
  expiry_date: DateTime.now + 1,
  enabled: "True",
  project_cost: 5.5,
  project_url: "http://www.unity3d.com",
)

# PROJECT 1 JOINS
tcp11 = TargetCountry.create(project_id: p1.id, country_id: brazil.id)
tcp12 = TargetCountry.create(project_id: p1.id, country_id: usa.id)
tcp13 = TargetCountry.create(project_id: p1.id, country_id: canada.id)
tcp14 = TargetCountry.create(project_id: p1.id, country_id: mexico.id)
tkp11 = TargetKey.create(project_id: p1.id, key_id: k25.id)
tkp12 = TargetKey.create(project_id: p1.id, key_id: k30.id)

p2 = Project.create(
  id: 2,
  project_name: "test project number 2",
  creation_date: DateTime.now,
  expiry_date: DateTime.now + 1,
  enabled: "True",
  project_cost: 38.4,
  project_url: "http://www.someotherurl.com",
)

# PROJECT 2 JOINS
tcp21 = TargetCountry.create(project_id: p2.id, country_id: brazil.id)
tcp22 = TargetCountry.create(project_id: p2.id, country_id: usa.id)
tcp23 = TargetCountry.create(project_id: p2.id, country_id: germany.id)
tkp21 = TargetKey.create(project_id: p2.id, key_id: k25.id)
tkp22 = TargetKey.create(project_id: p2.id, key_id: k17.id)

p3 = Project.create(
  id: 3,
  project_name: "test project number 3",
  creation_date: DateTime.now,
  expiry_date: DateTime.now + 1,
  enabled: false,
  project_cost: 3.3,
  project_url: "http://www.fakewebsite.com",
)

# PROJECT 3 JOINS
tcp21 = TargetCountry.create(project_id: p2.id, country_id: mexico.id)
tcp22 = TargetCountry.create(project_id: p2.id, country_id: usa.id)
tkp22 = TargetKey.create(project_id: p2.id, key_id: k17.id)
