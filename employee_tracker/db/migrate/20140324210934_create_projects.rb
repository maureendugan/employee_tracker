class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.column :name, :string
      t.column :active, :boolean

      t.timestamp
    end

    drop_table :past_projects
  end
end
