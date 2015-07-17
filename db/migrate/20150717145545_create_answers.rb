class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :bodyrails
      t.string :g
      t.string :model
      t.string :Answer
      t.text :body
      t.references :questions, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
