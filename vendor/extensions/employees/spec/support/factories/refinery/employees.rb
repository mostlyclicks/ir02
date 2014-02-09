
FactoryGirl.define do
  factory :employee, :class => Refinery::Employees::Employee do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

