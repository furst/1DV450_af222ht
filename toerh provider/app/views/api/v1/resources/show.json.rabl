object @resource

node(:self) { |resource| api_resource_path(resource)}

node :data do |r|
  {
  	:id => r.id,
  	:name => r.name,
  	:description => r.description,
  	:url => r.url,
  	:created_at => r.created_at,
  	:updated_at => r.updated_at
  }
end

child :user do
	attributes :id, :name, :email
	node(:link) { |user| api_user_path(user) }	
end

child :tags do
	attributes :name
	node(:link) { |tag| api_tag_path(tag) }	
end

child :license do
	attributes :name
	node(:link) { |license| api_license_path(license) }	
end

child :resource_type do
	attributes :name
	node(:link) { |resource_type| api_resourcetype_path(resource_type) }	
end