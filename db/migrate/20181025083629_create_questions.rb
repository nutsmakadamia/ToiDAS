class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :content
      t.integer :yes, default: 0
      t.integer :no, default: 0
      t.references :url, foreign_key: true

      t.timestamps
    end
  end
end
