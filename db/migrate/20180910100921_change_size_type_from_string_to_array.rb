class ChangeSizeTypeFromStringToArray < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :size, "varchar[] USING (string_to_array(size, ','))"
  end
end
