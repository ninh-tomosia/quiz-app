class CreateSubTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :sub_tickets do |t|
      t.integer     :sub_ticket_code
      t.integer     :ticket_id
      t.integer     :user_id
      t.timestamp   :deleted_at

      t.timestamps
    end
  end
end
