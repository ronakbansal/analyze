class CreateMarks < ActiveRecord::Migration
  def change
    create_table :marks do |t|
      t.integer :score
      t.references :student
      t.references :test
      t.timestamps
    end
  end
end
