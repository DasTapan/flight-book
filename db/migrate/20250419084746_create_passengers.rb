class CreatePassengers < ActiveRecord::Migration[7.2]
  def change
    create_table :passengers do |t|
      t.string :name
      t.string :email
      t.string :mobile
      t.references :booking

      t.timestamps
    end
  end
end
