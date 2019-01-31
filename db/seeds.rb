100.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@testusers.org"
    password = "password"
    User.create!(name:  name,
                 email: email,
                 password:              password,
                 password_confirmation: password)
  end
  
  
  #create! is the same as create except that it raises an exception for an invalid user rather than returning false. 
  
  
  lesson_topics = ["Ruby Basics", "Git and Github", "OO Ruby", "SQL", "ORM and ActiveRecord", "Rack and Middleware", "Sinatra", "Rails", "Javascript Basics", "Working with DOM", "CSS"]
  
  index = 0 
  while (index < lesson_topics.length)
    fake_description = Faker::Lorem.paragraph(sentence_count = 5)
    name = lesson_topics[index]
    LessonTopic.create!(
              name: name, description: fake_description, course_order: index + 1)
    index+=1
  end 
  
  
  
  users = User.order(:created_at).take(6)
  50.times do
    name = Faker::Lorem.sentence(2)
    description = Faker::Lorem.sentence(5)
    link = Faker::Internet.url
    lesson = "Rails"
    users.each { |user| user.tips.create!(
      name: name,
      description: description,
      resource_link: link,
      lesson_topic_id: rand(1..11)) }
  end