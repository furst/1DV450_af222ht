object @user

node(:self) { |user| api_user_path(user)}

node :data do |r|
  {
  	:uid => r.uid,
  	:name => r.name,
  	:email => r.email,
  	:created_at => r.created_at,
  	:updated_at => r.updated_at
  }
end