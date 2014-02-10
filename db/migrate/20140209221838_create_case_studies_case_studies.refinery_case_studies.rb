# This migration comes from refinery_case_studies (originally 1)
class CreateCaseStudiesCaseStudies < ActiveRecord::Migration

  def up
    create_table :refinery_case_studies do |t|
      t.string :title
      t.string :client
      t.text :testimonial
      t.integer :hero_image_id
      t.integer :before_image_id
      t.integer :after_image_id
      t.text :description
      t.integer :case_study_pdf_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-case_studies"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/case_studies/case_studies"})
    end

    drop_table :refinery_case_studies

  end

end
