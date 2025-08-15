FactoryBot.define do
  factory :order_address do
    postal_code    { '123-4567' }
    prefecture_id  { 2 }
    city           { '渋谷区' }
    address { '道玄坂1-2-3' }
    building_name  { '渋谷ビル101' }
    phone_number   { '09012345678' }
    token          { "tok_#{Faker::Alphanumeric.alphanumeric(number: 28)}" }
    
  end
end
