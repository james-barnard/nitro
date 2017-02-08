FactoryGirl.define do
  factory :purchase do
    product_load nil
    fb_user nil
    pos_type "MyString"
    amount 1
  end
end
