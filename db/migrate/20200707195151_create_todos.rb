class CreateTodos < ActiveRecord::Migration[6.0]
  def change
    create_table :todos do |t|
      t.string :date
      t.string :item
      t.boolean :completed

      t.timestamps
    end
  end
end
