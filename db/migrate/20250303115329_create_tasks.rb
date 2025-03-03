class CreateTasks < ActiveRecord::Migration[7.2]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :description
      t.string :assigned_to
      t.integer :status, default: 0  # Default to 'pending'
      t.boolean :completed, default: false


      t.timestamps
    end
  end
end
