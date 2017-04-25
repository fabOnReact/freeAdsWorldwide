class CreateCampaigntypes < ActiveRecord::Migration[5.0]
  def change
    create_table :campaigntypes do |t|
      t.string :name

      t.timestamps
    end
  end
end
