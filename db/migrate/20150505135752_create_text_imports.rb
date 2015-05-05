class CreateTextImports < ActiveRecord::Migration
  def change
    create_table :text_imports do |t|
      t.string :text

      t.timestamps null: false
    end
  end
end
