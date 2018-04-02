10.times do
  Article.create({
    titulo: Faker::Book.title,
    bajada: Faker::Book.title,
    cuerpo: Faker::Lorem.sentence
    })
end
