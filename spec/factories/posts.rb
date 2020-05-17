FactoryBot.define do
  
  factory :post do
    title       {"ポケモン"}
    review      {"かわいい"}
    image       {"https://pbs.twimg.com/profile_images/910863761795198977/hziHe73D_400x400.jpg"}
    rate        { Faker::Number.between(from: 1, to: 5) }
    created_at  { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    likes_count { Faker::Number.between(from: 0, to: 100) }
    user
  end

end