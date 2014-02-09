module Refinery
  module JobOpportunities
    class JobOpportunitiesController < ::ApplicationController

      before_filter :find_all_job_opportunities
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @job_opportunity in the line below:
        present(@page)
      end

      def show
        @job_opportunity = JobOpportunity.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @job_opportunity in the line below:
        present(@page)
      end

    protected

      def find_all_job_opportunities
        @job_opportunities = JobOpportunity.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/job_opportunities").first
      end

    end
  end
end
