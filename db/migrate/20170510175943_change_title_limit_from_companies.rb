class ChangeTitleLimitFromCompanies < ActiveRecord::Migration[5.0]
  def change
  	change_column :companies, :title, :string, :limit => 70
  end
end
