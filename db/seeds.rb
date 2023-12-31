# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user = User.where(email: "tommy.stlau@gmail.com").first_or_initialize
user.update!(password: "password", password_confirmation: "password")

100.times do |i|
  BlogPost.where(title: "Blog Post #{i+1}").first_or_create(
    content: "This is the content for blog post #{i+1}",
    published_at: 1.year.ago
  )
end
