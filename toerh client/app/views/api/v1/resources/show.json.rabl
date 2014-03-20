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
	attributes :uid, :name, :email
	node(:link) { |user| api_ruser_path(user) }	
end

child :tags do
	attributes :id, :name
	node(:link) { |tag| api_rtag_path(tag) }	
end

child :license do
	attributes :id, :name
	node(:link) { |license| api_rlicense_path(license) }	
end

child :resource_type do
	attributes :id, :name
	node(:link) { |resource_type| api_rresourcetype_path(resource_type) }	
end