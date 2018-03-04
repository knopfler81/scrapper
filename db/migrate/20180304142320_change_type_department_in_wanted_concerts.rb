class ChangeTypeDepartmentInWantedConcerts < ActiveRecord::Migration[5.0]
  def change
    change_column :wanted_concerts, :department, :string
  end
end
