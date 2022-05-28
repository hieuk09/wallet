# typed: false

FactoryBot.define do
  factory :import_transaction do
    description { 'MyString' }
    paid_at { '2020-08-08 10:10:01' }
    amount { 1000 }
    category
    import
    account
  end
end
