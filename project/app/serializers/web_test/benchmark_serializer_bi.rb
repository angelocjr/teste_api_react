# app/serializers/benchmark_serializer_bi.rb
class BenchmarkSerializerBI < BenchmarkSerializer
  attributes :total_results, :average_score 

  link :summary do |benchmark|
    "/api/web_test/bi/benchmarks/#{benchmark.id}/summary"
  end
end
