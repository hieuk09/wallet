# typed: false
FactoryBot.define do
  factory :category do
    name { 'name' }
    category_type { 'expense' }

    trait :income do
      category_type { Category::INCOME }
    end

    trait :expense do
      category_type { Category::EXPENSE }
    end
  end
end
