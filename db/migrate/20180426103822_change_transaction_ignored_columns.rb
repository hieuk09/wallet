# typed: true

class ChangeTransactionIgnoredColumns < ActiveRecord::Migration[5.2]
  def change
    change_column :transactions, :ignored, :boolean, default: false
  end
end
