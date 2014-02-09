module Refinery
  module JobOpportunities
    class JobOpportunity < Refinery::Core::BaseModel
      self.table_name = 'refinery_job_opportunities'

      attr_accessible :title, :description, :position

      validates :title, :presence => true, :uniqueness => true
    end
  end
end
