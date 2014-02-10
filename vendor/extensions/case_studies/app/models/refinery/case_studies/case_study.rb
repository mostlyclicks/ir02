module Refinery
  module CaseStudies
    class CaseStudy < Refinery::Core::BaseModel
      self.table_name = 'refinery_case_studies'

      attr_accessible :title, :client, :testimonial, :hero_image_id, :before_image_id, :after_image_id, :description, :case_study_pdf_id, :position

      validates :title, :presence => true, :uniqueness => true

      belongs_to :hero_image, :class_name => '::Refinery::Image'

      belongs_to :before_image, :class_name => '::Refinery::Image'

      belongs_to :after_image, :class_name => '::Refinery::Image'

      belongs_to :case_study_pdf, :class_name => '::Refinery::Resource'
    end
  end
end
