FactoryBot.define do
  
  factory :post do
    title   {"ポケモン"}
    review  {"かわいい"}
    rate    {4}
    image   {"https://pbs.twimg.com/profile_images/910863761795198977/hziHe73D_400x400.jpg"}
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    user
  end

end