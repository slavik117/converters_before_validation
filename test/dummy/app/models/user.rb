class User < ApplicationRecord

  downcase_before_validation_for :email

  squish_before_validation_for :name, :email

  upcase_before_validation_for :title

  string_converter_before_validation :camelcase, :camel_field

  validates :email, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "Not email format" }

end
