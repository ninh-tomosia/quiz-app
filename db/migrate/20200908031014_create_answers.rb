class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string    :option_value
      t.integer   :question_id
      t.boolean   :is_correct
      t.datetime  :delete_at

      t.timestamps
    end
  end
end
