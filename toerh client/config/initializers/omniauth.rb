require File.expand_path('lib/omniauth/strategies/toerh', Rails.root)

Rails.application.config.middleware.use OmniAuth::Builder do
  	provider :toerh, '8a5113f92393791fb043bdc150ab7f5d6836dae23ec99045ee167bc5e0b6f5d9', '598719b3252ccd6fef9dbf889e65df40af2360075f3d2ef17f244bb6182d1ca7'
end