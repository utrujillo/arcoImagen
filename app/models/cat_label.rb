class CatLabel < ApplicationRecord
  # validations
  validates :nombre, uniqueness: true
  validates :nombre, length: { minimum: 3 }
end
