Rails.application.routes.draw do
  #ROUTES APP
  namespace :api do
    post 'benchmarks/create', to: 'benchmarks#create'
    delete 'benchmarks/destroy', to: 'benchmarks#destroy'
    resources :benchmarks do
      resources :results
    end
  end

  #ROUTES BI 
  namespace :api do
      namespace :bi do
        get 'benchmarks/summary', to: 'benchmarks#summary'
        get 'benchmarks/:id/detailed_report', to: 'benchmarks#detailed_report'
        get 'results/aggregate', to: 'results#aggregate'
        post 'benchmarks/compare', to: 'benchmarks#compare'
      end
  end

end
