class CreateQuesions < ActiveRecord::Migration[6.0]
  def change
    create_table    :quesions do |t|
      t.string      :question
      t.string      :answer
      t.integer     :ticket_id
      t.timestamp   :delete_at

      t.timestamps
    end
  end
end
