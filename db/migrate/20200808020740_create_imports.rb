# typed: true
class CreateImports < ActiveRecord::Migration[6.0]
  def change
    create_table :imports do |t|
      t.string :name, null: false
      t.references :account, null: false, foreign_key: true, on_delete: :cascade, index: true

      t.timestamps null: false
    end
  end
end
