class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.integer :user_id
      t.string :role

      t.timestamps null: false
    end
  end
end
