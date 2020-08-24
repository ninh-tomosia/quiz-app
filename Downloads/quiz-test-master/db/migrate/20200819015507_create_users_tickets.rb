class CreateUsersTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :users_tickets do |t|
      t.integer    :user_id
      t.integer    :ticket_id
      t.float      :total_score
      t.timestamp  :time_complete
      t.timestamp  :deleted_at

      t.timestamps
    end
  end
end
