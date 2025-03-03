class CreateTasks < ActiveRecord::Migration[7.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.string :assigned_to
      t.integer :status
      t.boolean :completed

      t.timestamps
    end
  end
end
