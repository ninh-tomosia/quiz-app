class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string      :option_value
      t.integer     :question_id
      t.timestamp   :delete_at

      t.timestamps
    end
  end
end
