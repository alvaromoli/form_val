Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'sales/new'
  post 'sales', to: 'sales#create'
  get 'sales/done', to: 'sales#done'
end
