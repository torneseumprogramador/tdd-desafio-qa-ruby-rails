require 'test_helper'

class AlunoTest < ActiveSupport::TestCase
  def setup
    # Arrange
    @aluno = Aluno.new
  end

  test "nome deve estar presente" do
    # Act para o setter
    @aluno.nome = "João Mamata"

    # Act para o getter
    nome_valido = @aluno.nome.present?

    # assert
    assert nome_valido
  end

  test "matrícula deve estar presente" do
    @aluno.matricula = 111
    assert @aluno.matricula.present?
  end

  test "idade deve estar presente" do
    @aluno.idade = 22
    assert @aluno.idade.present?
  end

  test "data de nascimento deve estar presente" do
    @aluno.data_nascimento = DateTime.now
    assert @aluno.data_nascimento.present?
  end
end
