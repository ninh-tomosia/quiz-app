class CreateHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :histories do |t|
      t.integer  :question_id
      t.integer  :answer_id
      t.integer  :user_ticket_id
      t.boolean  :checked, default: false
      t.datetime :delete_at
      t.integer  :time

      t.timestamps
    end
  end
end
