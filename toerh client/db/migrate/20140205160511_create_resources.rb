class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :name
      t.text :description
      t.text :url
      t.belongs_to :resource_type, index: true
      t.belongs_to :license, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
