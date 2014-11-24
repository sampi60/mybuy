class Product < ActiveRecord::Base
  validates :name, presence: true

  has_attached_file :photo, styles: { medium: "300x300>",
                                       thumb:  "100x100>",
                                       small:  "50x50>" }
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
end
