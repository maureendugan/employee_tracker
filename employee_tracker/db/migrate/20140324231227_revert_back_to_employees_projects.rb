class RevertBackToEmployeesProjects < ActiveRecord::Migration
  def change
    drop_table :employees_projects
    create_table :employees_projects do |t|
      t.column :project_id, :int
      t.column :employee_id, :int
    end
  end
end
