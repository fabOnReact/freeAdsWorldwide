class CreateSurveys < ActiveRecord::Migration[5.0]
  def change
    create_table :surveys do |t|
      t.integer :company_id
      t.string :name

      t.timestamps
    end
  end
end
