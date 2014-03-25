class RenameColumnInEmployees < ActiveRecord::Migration
  def change
    change_table :employees do |t|
      t.rename :division_id, :divisions_id;
      t.rename :project_id, :projects_id;
    end
  end
end
