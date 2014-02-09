# This migration comes from refinery_job_opportunities (originally 1)
class CreateJobOpportunitiesJobOpportunities < ActiveRecord::Migration

  def up
    create_table :refinery_job_opportunities do |t|
      t.string :title
      t.text :description
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-job_opportunities"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/job_opportunities/job_opportunities"})
    end

    drop_table :refinery_job_opportunities

  end

end
