# app/serializers/api/bi/result_serializer_bi.rb
class Api::Bi::ResultSerializerBI < Api::ResultSerializerBi
  attributes(
    :average_case_rate,
    :max_death_case,
    :min_death_case,
    :report_generated_at
  )

  link :self do |result|
    "/api/web_test/bi/results/#{result.id}"
  end

  link :benchmark do |result|
    "/api/web_test/benchmarks/#{result.benchmark_id}"
  end
end
