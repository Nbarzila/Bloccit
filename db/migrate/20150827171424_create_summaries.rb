class CreateSummaries < ActiveRecord::Migration
  def change
    create_table :summaries do |t|
      t.string :body
      t.string :text
      t.references :post, index: true, foreign_key: true

    end
  end
end
