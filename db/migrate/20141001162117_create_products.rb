class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :base_cost, :precision => 10, :scale => 2
      t.decimal :duplicate_cost, :precision => 10, :scale => 2

      t.timestamps
    end
  end
end
