# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "CaseStudies" do
    describe "Admin" do
      describe "case_studies" do
        refinery_login_with :refinery_user

        describe "case_studies list" do
          before do
            FactoryGirl.create(:case_study, :title => "UniqueTitleOne")
            FactoryGirl.create(:case_study, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.case_studies_admin_case_studies_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.case_studies_admin_case_studies_path

            click_link "Add New Case Study"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::CaseStudies::CaseStudy.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::CaseStudies::CaseStudy.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:case_study, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.case_studies_admin_case_studies_path

              click_link "Add New Case Study"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::CaseStudies::CaseStudy.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:case_study, :title => "A title") }

          it "should succeed" do
            visit refinery.case_studies_admin_case_studies_path

            within ".actions" do
              click_link "Edit this case study"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:case_study, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.case_studies_admin_case_studies_path

            click_link "Remove this case study forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::CaseStudies::CaseStudy.count.should == 0
          end
        end

      end
    end
  end
end
