FactoryBot.define do
  factory :import_transaction do
    import { nil }
    description { 'MyString' }
    category { 'MyString' }
    transaction_date { '2020-08-08 10:10:01' }
    amount { '' }
  end
end
