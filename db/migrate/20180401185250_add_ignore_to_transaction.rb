class AddIgnoreToTransaction < ActiveRecord::Migration
  def change
    add_column :transactions, :ignored, :boolean, default: false, null: false
  end
end
