require 'faker'

10.times do
  key = ((0..5).map { ('a'..'z').to_a.sample }.join)
  Url.create(
    original:  Faker::Internet.url,
    shortened: key
    )
end
