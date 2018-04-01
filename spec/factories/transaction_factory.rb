FactoryBot.define do
  factory :transaction do
    trait :ignored do
      ignored true
    end
  end
end
