require 'test_helper'

class AlunoTest < ActiveSupport::TestCase
  test "deve salvar um novo aluno no banco de dados" do
    aluno = Aluno.new(nome: "João", matricula: 12345, idade: 20, data_nascimento: "2002-01-01")
    assert aluno.save

    aluno_salvo = Aluno.find_by(matricula: 12345)
    assert_equal "João", aluno_salvo.nome
    assert_equal 20, aluno_salvo.idade
    assert_equal Date.parse("2002-01-01"), aluno_salvo.data_nascimento
  end

  test "não deve salvar um aluno com matrícula repetida" do
    aluno1 = Aluno.new(nome: "João", matricula: 12345, idade: 20, data_nascimento: "2002-01-01")
    aluno1.save

    aluno2 = Aluno.new(nome: "Maria", matricula: 12345, idade: 18, data_nascimento: "2004-01-01")
    assert_not aluno2.save
  end

  test "não deve salvar um aluno sem nome" do
    aluno = Aluno.new(matricula: 12345, idade: 20, data_nascimento: "2002-01-01")
    assert_not aluno.save
  end

  test "não deve salvar um aluno sem matricula" do
    aluno = Aluno.new(nome: "Maria", idade: 20, data_nascimento: "2002-01-01")
    assert_not aluno.save
  end
end
