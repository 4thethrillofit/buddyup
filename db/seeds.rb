team1 = Team.create(name: 'bears')
team2 = Team.create(name: 'lions')

team1.members.create(name: 'Bob', email: '1@g.com')
team1.members.create(name: 'Jon', email: '2@g.com')
team1.members.create(name: 'Fei', email: '3@g.com')
team1.members.create(name: 'Zen', email: '4@g.com')
team1.generate_pair_records

team2.members.create(name: 'Lob', email: '5@g.com')
team2.members.create(name: 'Gon', email: '6@g.com')
team2.members.create(name: 'Lei', email: '7@g.com')
team2.members.create(name: 'Ben', email: '8@g.com')
team2.generate_pair_records