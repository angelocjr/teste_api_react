# app/serializers/result_serializer.rb
class ResultSerializer
  include JSONAPI::Serializer

  attributes (
    :name_result, 
    :country_first, 
    :total_case_first, 
    :death_case_first,
    :country_last, 
    :total_case_last, 
    :death_case_last,
    :initial_date, 
    :finish_date
  )
  
  belongs_to :benchmark

end
