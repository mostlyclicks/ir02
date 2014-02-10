module Refinery
  module CaseStudies
    class CaseStudiesController < ::ApplicationController

      before_filter :find_all_case_studies
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @case_study in the line below:
        present(@page)
      end

      def show
        @case_study = CaseStudy.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @case_study in the line below:
        present(@page)
      end

    protected

      def find_all_case_studies
        @case_studies = CaseStudy.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/case_studies").first
      end

    end
  end
end
