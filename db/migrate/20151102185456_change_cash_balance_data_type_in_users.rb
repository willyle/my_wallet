class ChangeCashBalanceDataTypeInUsers < ActiveRecord::Migration
  def up
  		change_column :users, :card_balance, :decimal, precision: 11, scale: 2
  end

  def down
  		change_column :users, :card_balance, :integer
  end
end
