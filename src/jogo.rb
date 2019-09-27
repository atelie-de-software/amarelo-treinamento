class Jogo
  def initialize
    @mario = 'm'
    @posicao_x = 0
    @posicao_y = 4
    @pulando = false
    @bloco_quebravel_inteiro = true
    @cogumelo_ativo = false
    @contador_tick = 0
    @monstro_ativo = false
    @posicao_monstro_x = 0
    @posicao_monstro_y = 4
  end

  def move(dx, dy)
    @posicao_x = [[@posicao_x + dx, 0].max, 5].min
    @posicao_y = [[@posicao_y + dy, 0].max, 4].min
  end

  def move_monstro
    return unless @monstro_ativo
    @posicao_monstro_x = [[@posicao_monstro_x + 1, 0].max, 5].min
  end

  def pula
    @pulando = true
  end

  def ativa_monstro
    @monstro_ativo = true if @contador_tick == 10
  end

  def mata_monstro
    if [@posicao_monstro_x,@posicao_monstro_y] == [@posicao_x,@posicao_y] && @mario == 'M'
      @monstro_ativo = false
      @mario = 'm'
    end
  end

  def pular
    return desce() unless @pulando

    sobe()
    @pulando = (@posicao_y != 1)
  end

  def sobe()     move( 0, -1);  end
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
      campo[4][3] = 'o' unless @cogumelo_ativo && @mario == 'M'
      campo[2][3] = '!'
      @cogumelo_ativo = true
    end

    campo[@posicao_monstro_y][@posicao_monstro_x] = 'w' if @monstro_ativo

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
    @contador_tick += 1

    pular
    move_monstro
    mata_monstro
    ativa_monstro
  end
end
