object @type

node(:self) { |type| api_type_path(type)}

node :data do |r|
  {
  	:id => r.id,
  	:name => r.name,
  	:created_at => r.created_at,
  	:updated_at => r.updated_at
  }
end