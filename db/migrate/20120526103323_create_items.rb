class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :name
      t.string :description
      t.float :price
      t.string :short_name
      t.boolean :favourite_flag

      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
