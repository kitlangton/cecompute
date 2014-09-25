class CreateOrderServices < ActiveRecord::Migration
  def change
    create_table :order_services do |t|
      t.references :order, index: true
      t.references :service, index: true

      t.timestamps
    end
  end
end
