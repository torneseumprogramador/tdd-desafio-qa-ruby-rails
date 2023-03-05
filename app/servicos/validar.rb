module Servicos
  class Validar
    def self.validar_cpf(cpf)
      return false if cpf.blank?
      
      cpf = cpf.gsub(/\D/, '') # Remove todos os caracteres que não são números

      # Verifica se o CPF tem 11 caracteres
      return false if cpf.length != 11

      # Verifica se todos os dígitos são iguais
      todos_digitos_iguais = true
      for i in 1..(cpf.length-1)
        if cpf[i] != cpf[0]
          todos_digitos_iguais = false
          break
        end
      end
      return false if todos_digitos_iguais

      # Verifica se o primeiro dígito verificador é válido
      soma = 0
      for i in 0..8
        soma += (10 - i) * cpf[i].to_i
      end
      digito_verificador = 11 - (soma % 11)
      digito_verificador = 0 if digito_verificador >= 10
      return false if digito_verificador != cpf[9].to_i

      # Verifica se o segundo dígito verificador é válido
      soma = 0
      for i in 0..9
        soma += (11 - i) * cpf[i].to_i
      end
      digito_verificador = 11 - (soma % 11)
      digito_verificador = 0 if digito_verificador >= 10
      return false if digito_verificador != cpf[10].to_i

      true
    end
  end
end
