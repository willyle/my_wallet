class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :phone
      t.string :firs_name
      t.string :last_name
      t.integer :card_balance

      t.timestamps null: false
    end
  end
end
