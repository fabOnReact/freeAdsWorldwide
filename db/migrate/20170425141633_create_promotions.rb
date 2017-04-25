class CreatePromotions < ActiveRecord::Migration[5.0]
  def change
    create_table :promotions do |t|
      t.references :campaigntype, foreign_key: true
      t.references :campaign, foreign_key: true
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
