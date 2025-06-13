class CreateResults < ActiveRecord::Migration[7.1]
  def change
    create_table :results do |t|
      t.text :name_result
      t.integer :total_cases1
      t.integer :total_cases2
      t.integer :total_recovered1
      t.integer :total_recovered2
      t.integer :total_deaths1
      t.integer :total_deaths2
      t.date :start_date
      t.date :end_date
      t.text :country1
      t.text :country2
      t.timestamps
    end
  end
end
