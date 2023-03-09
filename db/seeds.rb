# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.create(name: 'Tom', photo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Tom_Hanks_TIFF_2019.jpg/320px-Tom_Hanks_TIFF_2019.jpg', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Lilly', photo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/Lilly_James_%2835036323024%29.jpg/320px-Lilly_James_%2835036323024%29.jpg', bio: 'Teacher from Poland.')

first_post = Post.create(author_id: first_user.id, title: 'Hello', text: 'This is my first post')
second_post = Post.create(author_id: first_user.id, title: 'Hello again', text: 'This is my second post')
third_post = Post.create(author_id: first_user.id, title: 'Whats up', text: 'This is my third post')
fourth_post = Post.create(author_id: first_user.id, title: 'Let the 4th be with u', text: 'This is my 4th post')
lilly_first_post = Post.create(author_id: 15, title: 'Arrr!', text: 'This is Lilly first post')

Comment.create(post_id: first_post.id, author_id: second_user.id, text: 'Hi Tom!' )
Comment.create(post_id: first_post.id, author_id: second_user.id, text: 'Tom, please answer!' )
Comment.create(post_id: first_post.id, author_id: second_user.id, text: 'Are u there?' )
Comment.create(post_id: first_post.id, author_id: second_user.id, text: 'Tom! I need help' )
Comment.create(post_id: first_post.id, author_id: second_user.id, text: 'What is the ignore?' )
Comment.create(post_id: first_post.id, author_id: second_user.id, text: 'Sad, sad, Tom...' )

Like.create(post_id: first_post.id, author_id: second_user.id)
Like.create(post_id: second_post.id, author_id: second_user.id)