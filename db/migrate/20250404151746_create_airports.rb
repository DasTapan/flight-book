class CreateAirports < ActiveRecord::Migration[7.2]
  def change
    create_table :airports do |t|
      t.string :code
      t.string :city

      t.timestamps
    end
  end
end
