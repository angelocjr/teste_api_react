class WebTest::Benchmark < ApplicationRecord
  has_many :web_test_results, class_name: 'WebTest::Result', dependent: :destroy

  def self.create_benchmark(params)
    self.create!(
      name_benchmark: params[:name_benchmark]
    )
  end

  def self.delete_benchmark(benchmark)
    benchmark.destroy
  end
end
