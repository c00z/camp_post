p "Hello from seeds.rb"

User.destroy_all
Review.destroy_all

user_data = []
20.times do
  first = FFaker::Name.first_name
  last = FFaker::Name.last_name
  user_data << {
    first_name: first,
    last_name: last,
    email: "#{first[0]}_#{last}@example.com".downcase,
    username: "#{first[0]}_#{last}",
    password: 'test'
  }
end
user = User.create(user_data)



review_data = []
30.times do
  title = FFaker::Book.title
  description = FFaker::CheesyLingo.paragraph
  review_data << {
    title: title,
    description: description,
    user: user.sample,
  }
end

Review.create(review_data)


Post.all.each do |p|
  p.activities.push(Activity.order('RANDOM()').limit(3))
end






p "Goodbye from seeds.rb"
