class WebTest::Review < ApplicationRecord
  belongs_to :benchmark, class_name: 'WebTest::Benchmark'

  def self.create_result(benchmark, params)
    self.create!(
    )
  end

  def self.update_result(benchmark, params)
  end

  def self.delete_result(result)
    result.destroy
  end
end
