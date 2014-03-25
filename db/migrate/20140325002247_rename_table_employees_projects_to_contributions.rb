class RenameTableEmployeesProjectsToContributions < ActiveRecord::Migration
  def change
    rename_table :employees_projects, :contributions
  end
end
