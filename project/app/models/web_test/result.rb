class WebTest::Result < ApplicationRecord
  belongs_to :benchmark, class_name: 'WebTest::Benchmark'

  def self.create_result(params, benchmark)
    puts "parametros----->>>>>#{params}"

    self.create!(
      name_result: params[:name_result],
      total_cases1: params[:total_cases1],
      total_cases2: params[:total_cases2],
      total_recovered1: params[:total_recovered1],
      total_recovered2: params[:total_recovered2],
      total_deaths1: params[:total_deaths1],
      total_deaths2: params[:total_deaths2],
      start_date: params[:start_date],
      end_date: params[:end_date],
      country1: params[:country1],
      country2: params[:country2],
      benchmark_id: benchmark.id
    )
  end

  def self.update_result(benchmark, params)
  end

  def self.delete_result(result)
    result.destroy
  end
end
