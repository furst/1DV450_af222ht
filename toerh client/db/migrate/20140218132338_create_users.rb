class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :uid
      t.string :provider
      t.string :token
      t.string :auth_token
      t.datetime :token_expires

      t.timestamps
    end
  end
end
