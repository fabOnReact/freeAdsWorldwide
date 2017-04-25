class AddCompanyRefToCampaigns < ActiveRecord::Migration[5.0]
  def change
    add_reference :campaigns, :company, foreign_key: true
  end
end
