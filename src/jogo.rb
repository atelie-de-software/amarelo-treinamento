class Jogo
  def initialize
    @posicao_x = 0
    @posicao_y = 4
    @subindo = false
    @bloco_quebravel_inteiro = true
    @mario = 'm'
    @cogumelo_ativo = false
  end

  def move(dx, dy)
    @posicao_x = [[@posicao_x + dx, 0].max, 5].min
    @posicao_y = [[@posicao_y + dy, 0].max, 4].min
  end

  def sobe
    @subindo = true
  end

  def desce()    move( 0 , 1) end
  def esquerda() move(-1,   0) end
  def direita()  move( 1,   0) end

  def tiro; end

  def tela
    campo = [
      [' ', ' ', ' ', ' ', ' ', ' '],
      [' ', ' ', ' ', ' ', '#', ' '],
      [' ', ' ', ' ', '?', ' ', '#'],
      [' ', ' ', ' ', ' ', ' ', ' '],
      ['_', '_', '_', '_', '_', '_']
    ]

    unless @bloco_quebravel_inteiro
      campo[4][3] = 'o'
      campo[2][3] = '!'
      @cogumelo_ativo = true
    end

    if (@posicao_y >= 0 && @posicao_y <= 4) && (@posicao_x >= 0 && @posicao_x <= 6)
      campo[@posicao_y][@posicao_x] = @mario
      @bloco_quebravel_inteiro &= !(@posicao_y == 2 && @posicao_x == 3)
      if @cogumelo_ativo && (@posicao_y == 3 && @posicao_y == 3)
        @mario = 'M'
        campo[4][3] = '_'
      end
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
end
