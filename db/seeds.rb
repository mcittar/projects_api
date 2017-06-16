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
norway = Country.create(
  id: 6,
  name: "NORWAY"
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
  project_cost: 45.6,
  project_url: "http://www.highestvalidprojectcost.com",
)

# PROJECT 2 JOINS
tcp22 = TargetCountry.create(project_id: p2.id, country_id: usa.id)
tcp23 = TargetCountry.create(project_id: p2.id, country_id: germany.id)
tkp21 = TargetKey.create(project_id: p2.id, key_id: k25.id)
tkp22 = TargetKey.create(project_id: p2.id, key_id: k30.id)

p3 = Project.create(
  id: 3,
  project_name: "test project number 3",
  creation_date: DateTime.now,
  expiry_date: DateTime.now + 1,
  enabled: false,
  project_cost: 400,
  project_url: "http://www.disabledproject.com",
)

# PROJECT 3 JOINS
tcp31 = TargetCountry.create(project_id: p3.id, country_id: mexico.id)
tcp32 = TargetCountry.create(project_id: p3.id, country_id: usa.id)
tcp33 = TargetCountry.create(project_id: p3.id, country_id: norway.id)
tcp34 = TargetCountry.create(project_id: p3.id, country_id: germany.id)
tcp35 = TargetCountry.create(project_id: p3.id, country_id: canada.id)
tkp31 = TargetKey.create(project_id: p3.id, key_id: k17.id)

p4 = Project.create(
  id: 4,
  project_name: "test project number 4",
  creation_date: DateTime.now - 10,
  expiry_date: DateTime.now - 3,
  enabled: false,
  project_cost: 200,
  project_url: "http://www.expiredproject.com",
)

# PROJECT 4 JOINS
tcp41 = TargetCountry.create(project_id: p4.id, country_id: mexico.id)
tcp42 = TargetCountry.create(project_id: p4.id, country_id: usa.id)
tkp42 = TargetKey.create(project_id: p4.id, key_id: k17.id)

p5 = Project.create(
  id: 5,
  project_name: "test project number 5",
  creation_date: DateTime.now,
  expiry_date: DateTime.now + 3,
  enabled: true,
  project_cost: 16.5,
  project_url: "http://www.brazil16.com",
)

# PROJECT 5 JOINS
tcp51 = TargetCountry.create(project_id: p5.id, country_id: brazil.id)
tcp52 = TargetCountry.create(project_id: p5.id, country_id: usa.id)
tkp52 = TargetKey.create(project_id: p5.id, key_id: k17.id)

p6 = Project.create(
  id: 6,
  project_name: "test project number 6",
  creation_date: DateTime.now,
  expiry_date: DateTime.now + 3,
  enabled: true,
  project_cost: 18.7,
  project_url: "http://www.highestbrazil.com",
)

# PROJECT 6 JOINS
tcp61 = TargetCountry.create(project_id: p6.id, country_id: brazil.id)
tcp62 = TargetCountry.create(project_id: p6.id, country_id: usa.id)
tkp62 = TargetKey.create(project_id: p6.id, key_id: k17.id)

p7 = Project.create(
  id: 7,
  project_name: "test project number 7",
  creation_date: DateTime.now,
  expiry_date: DateTime.now + 3,
  enabled: true,
  project_cost: 34.5,
  project_url: "http://www.highestscience17.com",
)

# PROJECT 7 JOINS
tcp71 = TargetCountry.create(project_id: p7.id, country_id: norway.id)
tkp72 = TargetKey.create(project_id: p7.id, key_id: k17.id)
