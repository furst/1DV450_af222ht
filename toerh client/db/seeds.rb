# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Apiuser.create(:email => "test@test.se", :password => "abc123", :password_confirmation => "abc123", :name => "testanvändare")
Tag.create(:name => "testtagg")
Tag.create(:name => "testtagg2")
License.create(:name => "creative commons")
ResourceType.create(:name => "video")
ResourceType.create(:name => "text")
Resource.create(:name => "rails", :url => "www.rails.com", :description => "En fin resurs", :resource_type_id => "1", :tag_id => "1,2", :license_id => 1, :user_id => 1)
Resource.create(:name => "angular", :url => "www.angular.com", :description => "En resurs", :resource_type_id => "2", :tag_id => "2", :license_id => 1, :user_id => 1)
Resource.create(:name => "rails2", :url => "www.railscast.com", :description => "Ytterliggare en fin resurs", :resource_type_id => "2", :tag_id => "1", :license_id => 1, :user_id => 1)
Resource.create(:name => "phpresurs", :url => "www.php.com", :description => "Php är bra", :resource_type_id => "1", :tag_id => "1,2", :license_id => 1, :user_id => 1)
Resource.create(:name => "skapa ett direktiv", :url => "www.angular.com/directives", :description => "Direktiv är användbara!", :resource_type_id => "2", :tag_id => "2", :license_id => 1, :user_id => 1)
Resource.create(:name => "Sista resursen", :url => "www.rails.com", :description => "En fin resurs", :resource_type_id => "1", :tag_id => "1", :license_id => 1, :user_id => 1)
