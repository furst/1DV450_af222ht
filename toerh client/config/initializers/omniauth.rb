require File.expand_path('lib/omniauth/strategies/toerh', Rails.root)

Rails.application.config.middleware.use OmniAuth::Builder do
  	provider :toerh, '9eca5621ae3d4a93942d0ee16d4e2ef8d05e9945be542cc68941f21a4893829e', '3054286ca5655db94b653fc0fda3fa963bfe6ff2f085b60dc2ae7d1bef25f2f6'
end