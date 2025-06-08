class CreateBenchmarks < ActiveRecord::Migration[7.1]
  def change
    create_table :benchmarks do |t|
      t.text :name
      t.timestamps
    end
  end
end
