class CreateLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :logs do |t|
      t.string :question
      t.string :receipt_time
      t.string :level
      t.string :answer
      t.string :response_time

      t.timestamps
    end
  end
end
