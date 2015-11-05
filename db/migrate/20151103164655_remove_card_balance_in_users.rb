class RemoveCardBalanceInUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :card_balance
  end
end
