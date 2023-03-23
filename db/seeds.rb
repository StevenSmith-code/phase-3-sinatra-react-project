puts "🌱 Seeding spices..."

# Seed your database here
5.times do
    Article.create(
        author: "brandon",
        title: "This is the one",
        body: "lorem ipsum nfaokfnw kawfnllakwnf aklwnflka nlkwfn alwk nfkawnaw fakn afwa wnklwnf kanwkfln awfkawl fkn lakwnfkln awf"
    )
end

puts "✅ Done seeding!"
