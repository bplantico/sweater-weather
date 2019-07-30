class CreateUser < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string  :email,           unique: true
      t.string  :password_digest
      t.string  :api_key,         unique: true
      t.boolean :api_key_active,  default: true
      t.timestamps
    end
    add_index :users, :email
  end
end
