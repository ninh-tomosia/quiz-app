class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.string :name
      t.string :Album_id

      t.timestamps
    end
  end
end
