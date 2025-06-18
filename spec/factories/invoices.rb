FactoryBot.define do
  factory :invoice do
    sequence(:invoice_number) { |n| "C#{n}" }
    total { 20.20 }
    invoice_date { Time.current }
    status { "Vigente" }

    trait :cancelled do
      status { "Cancelado" }
    end
  end
end