class AddBenchmarksToResults < ActiveRecord::Migration[7.1]
  def change
    add_reference :results, :benchmark, null: false, foreign_key: true
  end
end
