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

    def chegada_cliente
      intervalo_chegada = rand(1..5)
      @tempo_atual += intervalo_chegada
      cliente = Cliente.new(@tempo_atual)
      @fila << cliente

    end

    def atender_cliente
      return if @fila.empty?

      cliente = @fila.shift
      cliente.inicio_atendimento = @tempo_atual
      tempo_atendimento = rand(2..6)
      cliente.fim_atendimento = @tempo_atual + tempo_atendimento
      @tempo_atual = cliente.fim_atendimento

      @clientes_atendidos += 1
      @total_tempo_espera += cliente.tempo_espera
      @total_tempo_sistema += cliente.tempo_no_sistema
      @ocupacao_servidor += tempo_atendimento

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
