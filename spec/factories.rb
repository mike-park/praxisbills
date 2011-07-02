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
    sequence(:code)
    short_description "Ergotherapy"
    pricelist
  end

  factory :bill_item do
    auth
    therapy
    quantity 1
    unit_price 1.99
  end

  factory :invoice do
    sent_date Date.current
  end
  
  factory :payment do
    invoice
    rec_date Date.current
    amount 20.99
  end
end
