# app/controllers/api/benchmarks_controller.rb
class Api::BenchmarksController < ApiController
  skip_before_action :verify_authenticity_token
  before_action :set_model

  def initialize
    super
  end

  def index
    puts 'index'
    data = set_model.all
    render_serializer(data)
  end

  def show
    data = set_model.find(params[:id])
    render_serializer(data)
  end

  def create
    hash = get_data_param
    if set_model.find_by(name_benchmark: set_name).present?
      benchmark = set_model.find_by(name_benchmark: set_name)
      service = set_cont_result.new
      service.create(hash, benchmark)
      render json: { success: true, message: "Resultado criado com sucesso", benchmark: benchmark }, status: :created
    else
      benchmark = set_model.create_benchmark(hash)
      service = set_cont_result.new
      service.create(hash, benchmark)
      render json: { success: true, message: "Benchmark criado com sucesso", benchmark: benchmark }, status: :created
    end 
  end

  def update
    data = set_model.find(params[:id])
    data.update!(benchmark_params)
    render_serializer(data)
  end

  def destroy
    puts 'destroyB---------------'
    data = model_result.find(params[:id])
    data.destroy
    head :no_content
  end

  private

  def get_data_param
      cases1 = params['covid_data_1']['cases']
      cases2 = params['covid_data_2']['cases']
      recovered1 = params['covid_data_1']['recovered']
      recovered2 = params['covid_data_2']['recovered']
      deaths1 = params['covid_data_1']['deaths']
      deaths2 = params['covid_data_2']['deaths']
      
      hash = {
      :name_benchmark => set_name,
      :total_cases1 => calculate_data(cases1),
      :total_cases2 => calculate_data(cases2),
      :total_recovered1 => calculate_data(recovered1),
      :total_recovered2 => calculate_data(recovered2),
      :total_deaths1 => calculate_data(deaths1),
      :total_deaths2 => calculate_data(deaths2),
      :start_date => params['start_date'],
      :end_date => params['end_date'],
      :country1 => params['country1'],
      :country2 => params['country2']
      }

      return hash
  end

  def set_name
    return "#{params['country1']} -VS- #{params['country2']}"
  end

  def calculate_data(data)
    number = 0 
    total = 0
    data.each do |key, value|
      number == 0 ? number = value : total += (value - number)
    end
    return total
  end

  def set_cont_result
     return Api::ResultsController
  end

  def set_model
    return WebTest::Benchmark
  end

  def render_serializer(data)
    render json: Api::BenchmarkSerializer.new(data).serializable_hash.to_json
  end
end
