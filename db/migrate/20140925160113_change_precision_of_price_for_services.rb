class ChangePrecisionOfPriceForServices < ActiveRecord::Migration
  def self.up
    change_table :services do |t|
      t.change :price, :decimal, :precision => 10, :scale => 2
    end
  end

  def self.down
    change_table :services do |t|
      t.change :price, :decimal, :precision => 2, :scale => 1
    end
  end
end
