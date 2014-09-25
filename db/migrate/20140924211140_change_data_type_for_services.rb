class ChangeDataTypeForServices < ActiveRecord::Migration
  def self.up
    change_table :services do |t|
      t.change :price, :decimal, :precision => 2, :scale => 1
    end
  end

  def self.down
    change_table :services do |t|
      t.change :price, :integer
    end
  end
end
