
FactoryGirl.define do
  factory :case_study, :class => Refinery::CaseStudies::CaseStudy do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

