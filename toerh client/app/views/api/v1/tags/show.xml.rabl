object @tag

node(:self) { |tag| api_tag_path(tag)}

node :data do |r|
  {
  	:id => r.id,
  	:name => r.name,
  	:created_at => r.created_at,
  	:updated_at => r.updated_at
  }
end