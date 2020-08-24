class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.string     :name_ticket
      t.timestamp  :time_quiz
      t.datetime   :date_start
      t.datetime   :date_finish
      t.string     :code_quiz
      t.timestamp  :deleted_at
      t.integer    :category_id
      t.integer    :user_id

      t.timestamps
    end
  end
end
