class Place < ApplicationRecord
  # validations
  validates :lugar, presence: true
  validates :direccion, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :descripcion_corta, presence: true
end
