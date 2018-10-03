5.times do
  User.create!({username: Faker::Internet.user_name, email: Faker::Internet.email, password: "password", admin: false})
end

3.times do
  User.create!({username: Faker::Internet.user_name, email: Faker::Internet.email, password: "password", admin: true})
end

7.times do
  Resource.create!({title: Faker::Hacker.noun, abstract: Faker::Hacker.say_something_smart, teacher_only: false, teacher_id: (rand(3)+6), url: "https://www.google.com/"})
end

4.times do
  Resource.create!({title: Faker::Hacker.adjective, abstract: Faker::Hacker.say_something_smart, teacher_only: true, teacher_id: (rand(3)+6), url: "https://www.google.com/"})
end

10.times do
  Like.create!({liker_id: Faker::Number.between(1, 8), resource_id: Faker::Number.between(1, 11)})
end

6.times do
  Tag.create!({name: Faker::Hacker.noun})
end

ResourceTag.create!({resource_id: 1, tag_id: (rand(6)+1)})
ResourceTag.create!({resource_id: 2, tag_id: (rand(6)+1)})
ResourceTag.create!({resource_id: 3, tag_id: (rand(6)+1)})
ResourceTag.create!({resource_id: 4, tag_id: (rand(6)+1)})
ResourceTag.create!({resource_id: 5, tag_id: (rand(6)+1)})
ResourceTag.create!({resource_id: 6, tag_id: (rand(6)+1)})
ResourceTag.create!({resource_id: 7, tag_id: (rand(6)+1)})
ResourceTag.create!({resource_id: 8, tag_id: (rand(6)+1)})
ResourceTag.create!({resource_id: 9, tag_id: (rand(6)+1)})
ResourceTag.create!({resource_id: 10, tag_id: (rand(6)+1)})
ResourceTag.create!({resource_id: 11, tag_id: (rand(6)+1)})
ResourceTag.create!({resource_id: 11, tag_id: (rand(6)+1)})
