class CreateRuns < ActiveRecord::Migration[5.0]
  def change
    create_table :runs do |t|
      t.references :campaign, foreign_key: true
      t.integer :runprintnumber
      t.integer :ownads

      t.timestamps
    end
  end
end
