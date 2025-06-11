# app/serializers/api/bi/benchmark_serializer_bi.rb
class Api::Bi::BenchmarkSerializer < Api::BenchmarkSerializerBi
  attributes :total_results, :average_score 

  link :summary do |benchmark|
    "/api/web_test/bi/benchmarks/#{benchmark.id}/summary"
  end
end
