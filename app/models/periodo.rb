class Periodo < ApplicationRecord
  validates :fecha_inicio, presence: true
  validates :fecha_fin, presence: true

  has_many :curso
end
