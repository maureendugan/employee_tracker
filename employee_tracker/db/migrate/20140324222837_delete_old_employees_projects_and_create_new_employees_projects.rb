class DeleteOldEmployeesProjectsAndCreateNewEmployeesProjects < ActiveRecord::Migration
  def change
    drop_table :employees_projects

    create_join_table :employees, :projects do |t|
      t.index :employee_id
      t.index :project_id
      t.column :current, :boolean
    end

  end
end
