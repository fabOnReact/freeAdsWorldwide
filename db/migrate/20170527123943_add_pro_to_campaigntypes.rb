class AddProToCampaigntypes < ActiveRecord::Migration[5.0]
  def change
    add_column :campaigntypes, :pro, :boolean, default: true
  end
end
