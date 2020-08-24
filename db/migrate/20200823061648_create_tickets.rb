class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.string    :name_ticket,           null: false, default: ""
      t.timestamp :time_quiz,             null: true,  default: ""
      t.datetime  :date_start,            null: true,  default: ""
      t.datetime  :date_finish,           null: true,  default: ""
      t.string    :code_quiz,             null: true,  default: ""
      t.timestamp :delete_at
      t.integer   :category_id
      t.integer   :user_id

      t.timestamps
    end
  end
end
