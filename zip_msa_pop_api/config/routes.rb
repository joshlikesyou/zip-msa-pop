Rails.application.routes.draw do
  get '/zip/:zip', to: 'zip_population#show'
end
