class ChangeDefaultValuesFromCampaigns < ActiveRecord::Migration[5.0]
  def change
  	change_table(:campaigns) do |t|
  		t.change_default :givenvisits, :default => 1
		t.change_default :obtainedvisits, :default => 1
		t.change_default :visitratio, :default => 1
		t.change_default :ads_received, :default => 0
	end
  end
end
