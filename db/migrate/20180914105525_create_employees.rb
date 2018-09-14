class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :name, null: false, default: ""
      t.string :email, null: false, default: ""
      t.string :address, null: false, default: ""

      t.timestamps
    end
  end
end
