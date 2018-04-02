10.times do
  Article.create({
    title: Faker::Book.title,
    subtitle: Faker::Book.title,
    body: Faker::Lorem.sentence
    })
end
