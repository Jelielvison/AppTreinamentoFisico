# App de Rotinas de Exercícios

Este aplicativo permite que os usuários criem e acompanhem rotinas de exercícios físicos, com funcionalidades para adicionar novos treinos, marcar exercícios como concluídos e acompanhar o progresso.

## Objetivo

O objetivo do app é ajudar os usuários a organizarem e acompanharem seus treinos diários de maneira prática e visual. 

## Funcionalidades

- **Criar Rotinas de Exercícios**: Adicione novos exercícios e organize suas séries e repetições.
- **Acompanhar Progresso**: Marque os exercícios como concluídos e veja o progresso ao longo do tempo.
- **Interface Simples e Intuitiva**: Navegação fácil entre a lista de treinos e o progresso do usuário.
- **Design Personalizado**: Estilização dos cartões de exercícios e botões.

## Tecnologias Utilizadas

- **Flutter**: Framework usado para o desenvolvimento do aplicativo.
- **Widgets Utilizados**:
  - `Text`
  - `ListView`
  - `Card`
  - `Image`
  - `Checkbox`
- **Stateful Widget**: Para adicionar novos treinos e marcar como concluídos.
- **Stateless Widget**: Para exibir a rotina de treinos.
- **Scaffold**: Estrutura da aplicação com AppBar e botões de ação.

## Estrutura de Dados

- **List**: Armazena a lista de treinos.
- **Map**: Armazena os exercícios e suas séries/repetições (exemplo: `{'exercicio': 'Flexão', 'series': '3x10'}`).

## Layout

- **Colunas e Listas**: Para organizar a exibição dos treinos e do progresso do usuário.
- **Botões**: Para adicionar novos exercícios e concluir treinos.
- **Navegação**: Entre as páginas de lista de treinos e a de progresso.

## Estilização

O aplicativo segue uma paleta de cores personalizada, focada em tons escuros e contrastantes para uma melhor experiência visual:
- ![#1c0b2b](https://via.placeholder.com/15/1c0b2b/000000?text=+) `#1c0b2b`
- ![#301c41](https://via.placeholder.com/15/301c41/000000?text=+) `#301c41`
- ![#413b6b](https://via.placeholder.com/15/413b6b/000000?text=+) `#413b6b`
- ![#5c65c0](https://via.placeholder.com/15/5c65c0/000000?text=+) `#5c65c0`
- ![#6f95ff](https://via.placeholder.com/15/6f95ff/000000?text=+) `#6f95ff`
