class Cliente
  attr_accessor :chegada, :inicio_atendimento, :fim_atendimento

  def initialize(chegada)
    @chegada = chegada
    @inicio_atendimento = nil
    @fim_atendimento = nil
  end
