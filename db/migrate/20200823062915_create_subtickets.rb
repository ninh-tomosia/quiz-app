class CreateSubtickets < ActiveRecord::Migration[6.0]
  def change
    create_table    :subtickets do |t|
      t.integer     :subticket_code  
      t.integer     :ticket_id
      t.json        :sub_content
      t.integer     :user_id   
      t.timestamp   :delete_at
      
      t.timestamps
    end
  end
end
