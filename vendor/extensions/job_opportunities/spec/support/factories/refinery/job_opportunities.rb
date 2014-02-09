
FactoryGirl.define do
  factory :job_opportunity, :class => Refinery::JobOpportunities::JobOpportunity do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

