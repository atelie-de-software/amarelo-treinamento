class Jogo
  def initialize(posicao_x = 0, posicao_y = 4)
    @posicao_x = posicao_x
    @posicao_y = posicao_y
    @contador_tick = 0
    @subindo = false
    @bloco_quebravel_inteiro = true
  end

  def sobe
    @subindo = true
  end

  def desce
    @posicao_y += 1 unless limite_inferior
  end

  def esquerda
    @posicao_x -= 1 unless limite_esquerdo
  end

  def direita
    @posicao_x += 1
  end

  def tiro; end

  def tela
    campo = [
      [' ', ' ', ' ', ' ', ' ', ' '],
      [' ', ' ', ' ', ' ', '#', ' '],
      [' ', ' ', ' ', '?', ' ', '#'],
      [' ', ' ', ' ', ' ', ' ', ' '],
      ['_', '_', '_', '_', '_', '_']
    ] if @bloco_quebravel_inteiro

    campo = [
      [' ', ' ', ' ', ' ', ' ', ' '],
      [' ', ' ', ' ', 'o', '#', ' '],
      [' ', ' ', ' ', '!', ' ', '#'],
      [' ', ' ', ' ', ' ', ' ', ' '],
      ['_', '_', '_', '_', '_', '_']
    ] unless @bloco_quebravel_inteiro

    if (@posicao_y >= 0 && @posicao_y <= 4) && (@posicao_x >= 0 && @posicao_x <= 6)
      campo[@posicao_y][@posicao_x] = 'm'
      @bloco_quebravel_inteiro &= !(@posicao_y == 2 && @posicao_x == 3)
    end

    campo.map { |linha| linha.reduce(:+) }.join("\n")
  end

  def tick
    if @subindo && @posicao_y > 1
      @posicao_y -= 1
      @subindo = false if @posicao_y == 1
    elsif @posicao_y < 4 && @subindo == false
      @posicao_y += 1
    end
  end

  private

  def limite_inferior
    @posicao_y + 1 > 4
  end

  def limite_esquerdo
    @posicao_x - 1 < 0
  end
end
