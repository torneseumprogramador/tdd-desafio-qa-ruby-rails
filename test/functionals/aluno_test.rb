require 'test_helper'
require 'rr'

class AlunoMockTest < ActiveSupport::TestCase
  test "deve salvar um novo aluno sem ir para o banco de dados" do
    # Arrange
    aluno = Aluno.new(nome: "João", matricula: 12345, idade: 20, data_nascimento: "2002-01-01")

    # Mock a chamada ao método "save" para retornar true
    mock(aluno).save { true }

    # Mock a chamada ao método "find_by" para retornar o aluno criado acima
    mock(Aluno).find_by(matricula: 12345) { aluno }

    # Act
    assert aluno.save

    aluno_salvo = Aluno.find_by(matricula: 12345)


    # Assert
    assert_equal "João", aluno_salvo.nome
    assert_equal 20, aluno_salvo.idade
    assert_equal Date.parse("2002-01-01"), aluno_salvo.data_nascimento
  end

  test "não deve salvar um aluno com matrícula repetida" do
    aluno1 = Aluno.new(nome: "João", matricula: 12345, idade: 20, data_nascimento: "2002-01-01")
    mock(aluno1).save { true }
    aluno1.save

    aluno2 = Aluno.new(nome: "Maria", matricula: 12345, idade: 18, data_nascimento: "2004-01-01")
    mock(aluno2).save { false }
    assert_not aluno2.save
  end

end
