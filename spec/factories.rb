FactoryGirl.define do
  factory :patient do
    last_name "Rotten"
  end

  factory :insurer do
    abbr "BKK"
    name "BKK Bertelsmann"
  end

  factory :auth do
    patient
    insurer
  end

  factory :pricelist do
    start_date Date.new(2011, 1, 1)
  end

  factory :therapy do
    sequence(:code) { |n| n }
    short_description "Ergotherapy"
    pricelist
  end
end
