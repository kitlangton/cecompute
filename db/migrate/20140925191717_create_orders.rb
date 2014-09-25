class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :service, index: true

      t.timestamps
    end
  end
end
