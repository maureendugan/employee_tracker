class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.column :name, :string
      t.column :division_id, :int
      t.column :project_id, :int

      t.timestamps
    end
  end
end
