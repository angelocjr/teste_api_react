# app/serializers/api/benchmark_serializer.rb
class Api::BenchmarkSerializer
  include JSONAPI::Serializer

  attributes :name_benchmark, :created_at, :updated_at

  has_many :web_test_results, serializer: 'Api::Result'
end
