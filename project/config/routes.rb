Rails.application.routes.draw do
  get '/',                                          to: 'web_test/welcome#index'

  namespace 'web_test' do
    get     '/',                                    to: 'welcome#index'
    get     'welcome',                              to: 'welcome#index'

    get     'welcome/create',                       to: 'welcome#create'
    post    'welcome/create_dynamic',               to: 'welcome#create_dynamic'

    get     'welcome/update',                       to: 'welcome#update'
    patch   'welcome/update_dynamic',               to: 'welcome#update_dynamic'

    get     'welcome/delete',                       to: 'welcome#delete'
    delete  'welcome/delete_dynamic',               to: 'welcome#delete_dynamic'

    get     'welcome/aleatory_din',                 to: 'welcome#aleatory_din'
    
    get     'welcome/search_din',                   to: 'welcome#search_din'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  #get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
