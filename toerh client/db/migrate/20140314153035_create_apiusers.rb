class CreateApiusers < ActiveRecord::Migration
  def change
  	create_table :apiusers do |t|
      t.string :email
      t.string :password_digest
      t.string :name
      t.string :access_token
      t.datetime :today, :default => Time.now
      t.boolean :is_admin, :default => 0
      t.boolean :blocked, :default => 0
      t.integer :count, :default => 0

      t.timestamps
    end
  end
end
