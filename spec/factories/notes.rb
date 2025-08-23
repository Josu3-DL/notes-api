FactoryBot.define do
  factory :note do
    title { Faker::Lorem.characters(number: 4) }
    content { Faker::Lorem.sentence(word_count: 2) }
    status {nil}
    priority {nil}
  end
end
