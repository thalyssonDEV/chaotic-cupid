# Chaotic-Cupid

**Descrição**  
**Chaotic Cupid** é um jogo desenvolvido para a 2ª **GameJam interna** no Laboratório de Robótica, Automação e Sistemas (LABIRAS). O objetivo do jogo é simples: o jogador controla um **cupido** que deve atirar flechas em inimigos que se aproximam dele, com cores específicas. Ao acertar **pares de inimigos da mesma cor**, os inimigos desaparecem, e o jogador ganha pontos. O objetivo principal é **sobreviver o maior tempo possível** e evitar ser atingido pelos inimigos.

## Modo de Jogo

O jogo se passa em um campo onde o **cupido** (personagem principal) está no centro. Inimigos de diferentes cores começam a aparecer aleatoriamente e caminham em direção ao cupido. O jogador deve atirar **flechas** nos inimigos, acertando **pares de inimigos da mesma cor**, para eliminá-los. Cada par eliminado concede pontos e ajuda o cupido a sobreviver por mais tempo.

### Regras:
- Atire em inimigos de **cores iguais** para eliminá-los.
- Inimigos de cores diferentes não podem ser eliminados juntos, o que aumenta a dificuldade.
- O objetivo é **sobreviver o maior tempo possível**, enquanto enfrenta um número crescente de inimigos.
- O jogo termina quando os inimigos alcançam o cupido e sua vida chega a zero.

## Mecânicas

- **Controle**: O cupido é controlado pelo jogador com as setas do teclado (ou mouse) e pode atirar flechas em qualquer direção.
- **Inimigos**: Inimigos aparecem aleatoriamente em direções variadas e vão em direção ao cupido. Eles têm **cores aleatórias** e devem ser eliminados em pares da mesma cor.
- **Pontos**: Cada vez que o jogador elimina um par de inimigos da mesma cor, ele ganha pontos.

## Tecnologias Utilizadas

- **Godot Engine**: Motor de jogo utilizado para o desenvolvimento do projeto.
- **GDScript**: Linguagem de programação utilizada para a implementação das mecânicas do jogo.
- **Arte**: A arte do jogo foi feita dentro da equipe com recursos internos e gratuitos.
- **Áudio**: Sons e efeitos sonoros criados ou licenciados para o jogo.

## Como Jogar

1. **Iniciar o Jogo**: Após carregar o jogo, o cupido aparecerá no centro da tela. O jogador pode mover o cupido utilizando as teclas de setas ou o mouse.
2. **Atirar Flechas**: Pressione o botão esquerdo do mouse para lançar uma flecha em direção aos inimigos, a flecha será direcionada para onde o cursor do mouse estiver apontando.
3. **Eliminar Inimigos**: Tente eliminar pares de inimigos da **mesma cor** para ganhar pontos.
4. **Sobreviver**: Confome o tempo passa, o jogo se torna mais difícil, com inimigos mais rápidos e em maior número.
5. **Fim do Jogo**: O jogo termina quando o cupido é alcançado pelos inimigos e sua vida zera. O objetivo é **sobreviver o maior tempo possível**.
