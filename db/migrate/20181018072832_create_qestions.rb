class CreateQestions < ActiveRecord::Migration[5.2]
  def change
    create_table :qestions do |t|
      t.string :qestion
      t.integer :yes
      t.integer :no
      t.references :url, foreign_key: true

      t.timestamps
    end
  end
end
