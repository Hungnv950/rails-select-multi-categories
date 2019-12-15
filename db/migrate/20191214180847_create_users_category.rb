class CreateUsersCategory < ActiveRecord::Migration[6.0]
  def change
    create_table :users_categories do |t|
      t.references :user, type: :bigint
      t.references :category, type: :bigint
      t.string :other_content

      t.timestamps
    end
  end
end
