FactoryBot.define do
  factory :user do
    name {FFaker::Name.name}
    email {FFaker::Internet.email}
    password {"111111"}
    phone_number {FFaker::PhoneNumber.phone_number}
    address {FFaker::Address.street_address}
  end
end
