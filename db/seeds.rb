project1 = Project.create name: 'Project 1', description: 'description 1'
project2 = Project.create name: 'Project 2', description: 'description 2'

user_a = User.create name: 'a', email: 'a@a.a', password: 'a'
user_b = User.create name: 'b', email: 'b@b.b', password: 'b'

ticket1 = Ticket.create name: 'Ticket 1', body: 'body 1', status: 'new', project_id: 1, user_id: 1
ticket2 = Ticket.create name: 'Ticket 2', body: 'body 2', status: 'blocked', project_id: 1, user_id: 1
ticket3 = Ticket.create name: 'Ticket 3', body: 'body 3', status: 'in_progress', project_id: 2, user_id: 1, assignee_id: 1
ticket4 = Ticket.create name: 'Ticket 4', body: 'body 4', status: 'fixed', project_id: 2, user_id: 2, assignee_id: 2

tag1 = Tag.create name: 'tag1', tickets: [ticket1]
tag2 = Tag.create name: 'tag2', tickets: [ticket2]
tag3 = Tag.create name: 'tag3', tickets: [ticket1, ticket2, ticket3]
tag4 = Tag.create name: 'tag4'

comment1 = Comment.create body: 'comment1', ticket: ticket1, creator: user_a
comment2 = Comment.create body: 'comment2', ticket: ticket1, creator: user_a
comment3 = Comment.create body: 'comment3', ticket: ticket2, creator: user_a
comment4 = Comment.create body: 'comment4', ticket: ticket2, creator: user_b
comment5 = Comment.create body: 'comment5', ticket: ticket3, creator: user_b
updated_comment = Comment.create body: 'updated comment', ticket: ticket1, creator: user_a, created_at: 2.days.ago, updated_at: 1.day.ago 
