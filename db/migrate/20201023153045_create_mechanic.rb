class CreateMechanic < ActiveRecord::Migration[5.2]
  def change
    create_table :mechanics do |t|
      t.string :name
      t.integer :years_xp
    end
  end
end
