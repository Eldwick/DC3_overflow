# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Question.destroy_all

# Question.create!([
#   {
#     subject: "How do you easily change from SQLite to PostgreSQL?",
#     body: "I have a rails app that's databases are in SQLite (The dev and production). Since I am moving to heroku, I want to convert my database to PostgreSQL."
#   },
# {title: "I am a beer", body: "La ti da!"},
# {title: "Welcome to the Jungle", body: "Derp"},
# {title: "I accidentally", body: "The whole thing"},
# {title: "BLOGE", body: "Herp"},
# {title: "Hey what", body: "Is going on?"}
#       ])

Category.destroy_all

Category.create!([
  {
    name: 'Rails'
  },
  {
    name: 'Ruby'
  },
  {
    name: 'HTML'
  },
  {
    name: 'CSS'
  },
  {
    name: 'JavaScript'
  },
  {
    name: 'jQuery'
  },
  {
    name: 'Sass'
  },
  {
    name: 'PostgreSQL'
  },
  {
    name: 'Career'
  },
  {
    name: 'Other'
  }
])