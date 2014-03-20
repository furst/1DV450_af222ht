class Resource < ActiveRecord::Base
	has_many :taggings
	has_many :tags, through: :taggings
	belongs_to :resource_type
	belongs_to :license
	belongs_to :user

	validates :name, presence: true
	validates :description, presence: true
	validates :url, presence: true
	validates :resource_type_id, numericality: { only_integer: true }
	validates :license_id, numericality: { only_integer: true }

	paginates_per 20

	def self.search(search)
  		if search
    		find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
  		else
    		find(:all)
  		end
	end
end
