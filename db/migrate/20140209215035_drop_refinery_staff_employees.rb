class DropRefineryStaffEmployees < ActiveRecord::Migration
  def up
    drop_table :refinery_staff_employees
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
