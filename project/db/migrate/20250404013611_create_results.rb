class CreateResults < ActiveRecord::Migration[7.1]
  def change
    create_table :results do |t|
      t.text :name_result
      t.text :country_first
      t.integer :total_case_first
      t.integer :death_case_first
      t.text :country_last
      t.integer :total_case_last
      t.integer :death_case_last
      t.integer :total_difference
      t.integer :death_diferrence
      t.date :initial_date
      t.date :finish_date
      t.timestamps
    end
  end
end
