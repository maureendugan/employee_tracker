class CreatePastProjects < ActiveRecord::Migration
  def change
    create_table :past_projects do |t|
      t.column :employee_id, :int
      t.column :past_project_id, :int

      t.timestamps
    end
  end
end
