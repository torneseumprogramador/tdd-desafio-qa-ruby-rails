require 'test_helper'
# require_relative '../../app/servicos/validar'
require_relative "#{Rails.root}/app/servicos/validar"

class ValidarTest < ActiveSupport::TestCase
  test "CPF válido deve ser aceito" do
    # Arrange
    cpf = "529.982.247-25"

    # Act
    cpf_valido = Servicos::Validar.validar_cpf(cpf)

    # Assert
    assert cpf_valido
  end

  test "CPF inválido deve ser rejeitado" do
    # Arrange
    cpf = "529.982.247-24"

    # Act
    cpf_valido = Servicos::Validar.validar_cpf(cpf)

    # Assert
    refute cpf_valido
  end

  test "CPF no formato errado deve ser rejeitado" do
    # Arrange
    cpf = "123.456.789"

    # Act
    cpf_valido = Servicos::Validar.validar_cpf(cpf)

    # Assert
    refute cpf_valido
  end

  test "CPF vazio deve ser rejeitado" do
    # Arrange
    cpf = ""

    # Act
    cpf_valido = Servicos::Validar.validar_cpf(cpf)

    # Assert
    refute cpf_valido
  end

  test "CPF com espaço deve ser aceito" do
    # Arrange
    cpf = "529.982.247-25 "

    # Act
    cpf_valido = Servicos::Validar.validar_cpf(cpf)

    # Assert
    assert cpf_valido
  end

  test "CPF nulo deve ser rejeitado" do
    # Arrange
    cpf = nil

    # Act
    cpf_valido = Servicos::Validar.validar_cpf(cpf)

    # Assert
    refute cpf_valido
  end
end
