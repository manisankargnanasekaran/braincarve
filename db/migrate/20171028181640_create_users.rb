class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email_id
      t.string :password_hash
      t.string :password_salt
      t.string :username
      
      t.timestamps
    end
  end
end
