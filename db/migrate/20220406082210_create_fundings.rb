class CreateFundings < ActiveRecord::Migration[7.0]
  def change
    create_table :fundings do |t|
      t.string :name
      t.integer :amount

      t.timestamps
    end
  end
end
