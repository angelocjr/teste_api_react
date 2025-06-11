# app/controllers/api/bi/benchmarks_controller.rb
class Api::Bi::BenchmarksController < Api::BenchmarkController
  before_action :set_model

  def initialize
    super
  end

  def summary
    summary_response
  end

  def detailed_report
    detailed_report_response
  end

  def compare
    compare_response
  end

  private

  def summary_response
    ap 'summary'
  end

  def detailed_report_response
    ap 'detailed'
  end

  def compare_response
    ap 'compare'
  end

   def render_serializer(data)
    render json: Api::Bi::BenchmarkSerializer.new(data).serializable_hash.to_json
   end

end
