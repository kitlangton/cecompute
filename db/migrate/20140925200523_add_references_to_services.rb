class AddReferencesToServices < ActiveRecord::Migration
  def change
    change_table :services do |t|
      t.references :order, index: true
    end
  end
end
