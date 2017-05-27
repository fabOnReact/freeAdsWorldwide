class AddProToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :pro, :boolean, default: false
  end
end
