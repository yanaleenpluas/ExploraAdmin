class Estudiante < ApplicationRecord
  validates :nombre, presence: true
  validates :apellido, presence: true
  
  has_many_and_belongs_to_many :curso
  # TODO: Maybe validate cedula as well.
end
