class CreateUserTickets < ActiveRecord::Migration[6.0]
  def change
    create_table  :user_tickets do |t|
      t.integer   :user_id,       null: true,  default: ""
      t.integer   :ticket_id,     null: true,  default: ""
      t.float     :total_score,   null: true,  default: 0
      t.integer   :time_complete, null: true,  default: ""
      t.timestamp :delete_at

      t.timestamps
    end
  end
end
