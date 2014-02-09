module Refinery
  module Products
    class Product < Refinery::Core::BaseModel
      self.table_name = 'refinery_products'

      attr_accessible :name, :prod_image_id, :prod_pdf_id, :prod_description, :position

      validates :name, :presence => true, :uniqueness => true

      belongs_to :prod_image, :class_name => '::Refinery::Image'

      belongs_to :prod_pdf, :class_name => '::Refinery::Resource'
    end
  end
end
