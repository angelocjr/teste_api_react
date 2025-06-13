# app/serializers/api/results_serializer.rb
class Api::ResultSerializer
  include JSONAPI::Serializer

  attributes :name_result, 
             :total_cases1
             :total_cases2
             :total_recovered1
             :total_recovered2
             :total_deaths1
             :total_deaths2
             :start_date
             :end_date
             :country1
             :country2
             :benchmark_id

end
