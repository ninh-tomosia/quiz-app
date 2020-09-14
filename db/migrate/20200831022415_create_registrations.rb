class CreateRegistrations < ActiveRecord::Migration[6.0]
  def change
    create_table :registrations do |t|

      t.string    :full_name
      t.string    :company
      t.string    :telephone
      t.string    :email
      t.string    :card_token
      t.timestamp :delete_at

      t.timestamps
    end
  end
end
