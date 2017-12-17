class CreateWantedConcerts < ActiveRecord::Migration[5.0]
  def change
    create_table :wanted_concerts do |t|
      t.string :department
      t.references :user

      t.timestamps
    end
  end
end
