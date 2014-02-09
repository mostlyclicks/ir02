module Refinery
  module JobOpportunities
    module Admin
      class JobOpportunitiesController < ::Refinery::AdminController

        crudify :'refinery/job_opportunities/job_opportunity',
                :xhr_paging => true

      end
    end
  end
end
