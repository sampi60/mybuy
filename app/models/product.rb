class Product < ActiveRecord::Base
  validates :name, presence: true
  validates :price, allow_nil: true, numericality: { greater_than_or_equal_to: 0.01 }

  has_attached_file :photo, styles: { medium: "300x300>",
                                       thumb:  "100x100>",
                                       small:  "50x50>" }
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
end
