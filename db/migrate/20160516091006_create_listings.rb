class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :q1
      t.string :q2
      t.string :q3
      t.references :user, index: true, foreign_key: true
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
