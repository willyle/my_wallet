class RenameColInUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :firs_name
  	add_column :users, :first_name, :string
  end
end
