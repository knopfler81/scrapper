class ChangeDateFormatConcerts < ActiveRecord::Migration[5.0]
  def change
    change_column :concerts, :date, :string


  end
end
