class CreateMCategory < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :content
      t.string :key_name

      t.timestamps
    end
  end
end
