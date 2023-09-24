class Docente < ApplicationRecord
  validates :nombre, presence: true
  validates :apellido, presence: true
  # TODO: Maybe validate cedula as well.

  has_many :curso
end
