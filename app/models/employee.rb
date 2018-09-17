class Employee < ApplicationRecord
  has_one :image, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :image

	def self.attributes_for_import(row)
    {
      :name => row["Employee Name"].to_s.squish,
      :email => row["Email"].to_s.squish,
      :address => row["Address"].to_s.squish
    }
  end
end
