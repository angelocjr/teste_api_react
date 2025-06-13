# app/controllers/api/benchmarks_controller.rb
class Api::BenchmarksController < ApiController
  before_action :set_model

  def initialize
    super
  end

  def index
    data = set_model.all
    render_serializer(data)
  end

  def show
    data = set_model.find(params[:id])
    render_serializer(data)
  end

  def create
    data = set_model.create!(benchmark_params)
    render_serializer(data)
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

  def set_model
    return WebTest::Benchmark
  end

  def render_serializer(data)
    render json: Api::BenchmarkSerializer.new(data).serializable_hash.to_json
  end

  def benchmark_params
    params.require(:result).permit(
      :name_benchmark,
    )
  end
end
