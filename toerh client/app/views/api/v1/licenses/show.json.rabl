object @license

node(:self) { |license| api_license_path(license)}

node :data do |r|
  {
  	:id => r.id,
  	:name => r.name,
  	:created_at => r.created_at,
  	:updated_at => r.updated_at
  }
end