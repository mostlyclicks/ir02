module Refinery
  module Employees
    class Employee < Refinery::Core::BaseModel
      self.table_name = 'refinery_employees'

      attr_accessible :name, :job_title, :bio, :employee_pict_id, :position

      validates :name, :presence => true, :uniqueness => true

      belongs_to :employee_pict, :class_name => '::Refinery::Image'
    end
  end
end
