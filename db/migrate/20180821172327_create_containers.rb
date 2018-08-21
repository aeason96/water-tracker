class CreateContainers < ActiveRecord::Migration[5.2]
  def change
    create_table :containers do |t|
      t.string :name
      t.integer :volume
      t.timestamps
    end
  end
end
