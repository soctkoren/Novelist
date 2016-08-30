# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

john = User.create(email: "john@gmail.com", password: "1234qwer")
story = Story.create(image_url: "yo", user_id: 1)
# likes = Like.create(user_id: 1, story_id: 1)
segment = Segment.create(story_id: 1)
sentence = Sentence.create(sentence: "seee", user_id: 1, segment_id: 1)
# votes = Vote.create(vote_count:1, user_id: 1, sentence_id: 1)