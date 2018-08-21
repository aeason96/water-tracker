class CreateDrinks < ActiveRecord::Migration[5.2]
  def change
    create_table :drinks do |t|
      t.integer :volume
      t.references :user, foreign_key: true
      t.timestamps
    end
    add_index :drinks, [:user_id, :created_at]
  end
end
