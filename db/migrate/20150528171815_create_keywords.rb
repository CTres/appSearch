class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.string  :value
      t.text  :result
      t.timestamps null: false
    end

    create_table :matches do |t|
      t.belongs_to :keyword, index: true
      t.belongs_to :app, index: true
      t.text :term
      t.integer :rank
      t.timestamps null: false
    end
  end
end
