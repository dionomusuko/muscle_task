class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :menu
      t.integer :time
      t.integer :rep
      t.integer :set
      t.text :comment

      t.timestamps
    end
  end
end
