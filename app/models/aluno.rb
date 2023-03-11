class Aluno < ApplicationRecord
    validates :nome, :matricula, presence: true
    validates :matricula, uniqueness: true
end
  
