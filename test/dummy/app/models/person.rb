class Person < ApplicationRecord

  validates :email, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "Not email format"}

end
