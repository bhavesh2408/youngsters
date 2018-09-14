class Product < ApplicationRecord
  mount_uploader :image, ImageUploader


  def self.attributes_for_import(row)
    {
      :name => row["Product Name"].to_s.squish,
      :code => row["Product Code"].to_s.squish,
      :price => row["Price"].to_s.squish,
      :size => row["Size"].to_s.squish.split(","),
      :category => row["Category"].to_s.squish,
      :quantity => row["Quantity"].to_s.squish
    }
  end

end
