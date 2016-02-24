FactoryGirl.define do
  factory :course do
    sequence(:user_id) { |n| "User #{n}." }
    sequence(:title) { |n| "Coursetitle #{n}." }
    sequence(:description) { |n| "Coursedescriprion #{n}." }
  end
end
