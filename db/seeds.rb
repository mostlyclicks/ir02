# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Added by Refinery CMS Pages extension
Refinery::Pages::Engine.load_seed

# Added by Refinery CMS Products extension
Refinery::Products::Engine.load_seed

# Added by Refinery CMS Employees extension
Refinery::Employees::Engine.load_seed

# Added by Refinery CMS JobOpportunities extension
Refinery::JobOpportunities::Engine.load_seed

# Added by Refinery CMS CaseStudies extension
Refinery::CaseStudies::Engine.load_seed

# Added by Refinery CMS Testimonials extension
Refinery::Testimonials::Engine.load_seed

# Added by Refinery CMS Inquiries engine
Refinery::Inquiries::Engine.load_seed
