class WebTest::Benchmark < ApplicationRecord
  has_many :web_test_results, class_name: 'WebTest::Result'

  def self.create_benchmark(params)
    self.create!(
      name_benchmark: params[:name]
    )
  end

  def self.delete_benchmark(benchmark)
    benchmark.destroy
  end
end
