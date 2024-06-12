require "simulador_fila/version"
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

  class SimuladorFila
    attr_accessor :fila, :tempo_atual, :clientes_atendidos, :total_tempo_espera, :total_tempo_sistema

    def initialize
      @fila = []
      @tempo_atual = 0
      @clientes_atendidos = 0
      @total_tempo_espera = 0
      @total_tempo_sistema = 0
      @ocupacao_servidor = 0
    end

    def simular(ciclos)
      ciclos.times do
        chegada_cliente
        atender_cliente
      end

      calcular_estatisticas
    end
  end

end
