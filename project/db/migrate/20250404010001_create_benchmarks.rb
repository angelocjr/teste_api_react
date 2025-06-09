class CreateBenchmarks < ActiveRecord::Migration[7.1]
  def change
    create_table :benchmarks do |t|
      t.text :name_benchmark
      t.timestamps
    end
  end
end
