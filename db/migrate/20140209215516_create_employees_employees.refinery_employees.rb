# This migration comes from refinery_employees (originally 1)
class CreateEmployeesEmployees < ActiveRecord::Migration

  def up
    create_table :refinery_employees do |t|
      t.string :name
      t.string :job_title
      t.text :bio
      t.integer :employee_pict_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-employees"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/employees/employees"})
    end

    drop_table :refinery_employees

  end

end
