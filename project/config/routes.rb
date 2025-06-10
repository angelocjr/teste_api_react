Rails.application.routes.draw do
  
  namespace :api do
    resources :benchmarks do
      resources :resultados
    end
  end

  namespace :api do
    namespace :web_test do
      namespace :bi do
        get 'benchmarks/summary', to: 'benchmarks#summary'
        get 'benchmarks/:id/detailed_report', to: 'benchmarks#detailed_report'
        get 'results/aggregate', to: 'results#aggregate'
        post 'benchmarks/compare', to: 'benchmarks#compare'
      end
    end
  end

end
