class CreateGroups < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
      t.integer :year
      t.integer :semester
      t.integer :number

      t.timestamps
    end
  end

  def self.down
    drop_table :groups
  end
end
