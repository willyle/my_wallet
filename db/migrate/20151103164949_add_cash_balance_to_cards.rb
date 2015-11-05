class AddCashBalanceToCards < ActiveRecord::Migration
  def change
  	add_column :cards, :cash_balance, :decimal, precision: 11, scale: 2
  end
end
