class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :name_category,   null: false, default: ""
      t.string :image,           null: true,  default: ""
      t.integer :user_id,        null: true,  default: ""
      t.datetime :delete_at

      t.timestamps
    end
  end
end
