class Cliente
  attr_accessor :chegada, :inicio_atendimento, :fim_atendimento

  def initialize(chegada)
    @chegada = chegada
    @inicio_atendimento = nil
    @fim_atendimento = nil
  end

  def tempo_espera
    @inicio_atendimento - @chegada
  end

  def tempo_no_sistema
    @fim_atendimento - @chegada
  end

end
