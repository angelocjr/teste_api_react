# app/serializers/api/results_serializer.rb
class Api::ResultSerializer
  include JSONAPI::Serializer

  attributes :name_result, 
             :country_first, 
             :total_case_first, 
             :death_case_first,
             :country_last, 
             :total_case_last, 
             :death_case_last,
             :initial_date, 
             :finish_date

  belongs_to :web_test_benchmark, serialize: 'Api::Benchmark'

end
