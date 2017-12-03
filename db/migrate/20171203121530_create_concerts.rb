class CreateConcerts < ActiveRecord::Migration[5.0]
  def change
    create_table :concerts do |t|
      t.datetime :date
      t.string :city
      t.timestamps
    end
  end
end
