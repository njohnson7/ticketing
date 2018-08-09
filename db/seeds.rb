# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

project1 = Project.create name: 'Project 1', description: 'description 1'
project2 = Project.create name: 'Project 2', description: 'description 2'

ticket1 = Ticket.create name: 'Ticket 1', body: 'body 1', status: 'new', project_id: 1
ticket2 = Ticket.create name: 'Ticket 2', body: 'body 2', status: 'blocked', project_id: 1
ticket3 = Ticket.create name: 'Ticket 3', body: 'body 3', status: 'in_progress', project_id: 2
ticket4 = Ticket.create name: 'Ticket 4', body: 'body 4', status: 'fixed', project_id: 2

tag1 = Tag.create name: 'tag1', tickets: [ticket1]
tag2 = Tag.create name: 'tag2', tickets: [ticket2]
tag3 = Tag.create name: 'tag3', tickets: [ticket1, ticket2, ticket3]
tag4 = Tag.create name: 'tag4'

user_a = User.create name: 'a', email: 'a@a.a', password: 'a'
