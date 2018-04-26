FactoryBot.define do
  factory :transaction do
    account
    category

    trait :ignored do
      ignored true
    end
  end
end
