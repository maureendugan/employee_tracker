class CreateEmployeesProjects < ActiveRecord::Migration
  def change
    create_table :employees_projects do |t|
      t.column :employee_id, :int
      t.column :project_id, :int
      t.column :current, :boolean

      t.timestamps
    end
    rename_column :employees, :divisions_id, :division_id
    remove_column :employees, :projects_id, :int
  end
end
