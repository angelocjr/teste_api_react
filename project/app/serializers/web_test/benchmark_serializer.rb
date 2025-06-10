# app/serializers/benchmark_serializer.rb
#
class BenchmarkSerializer
  include JSONAPI::Serializer

  attributes :name_benchmark, :created_at, :updated_at

  has_many :web_test_results, class_name: 'WebTest::Result'
end
