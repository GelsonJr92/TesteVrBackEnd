# language: pt
Funcionalidade: Manipulação de String

  Esquema do Cenário: Remover texto após os marcadores
    Dado a string de entrada <entrada>
    E os marcadores <marcadores>
    Quando eu removo o texto após os marcadores
    Entao a saída esperada é: <saida_esperada>

    Exemplos:
      | entrada                                  | marcadores               | saida_esperada          |
      | "bananas, tomates # e ventiladores"      | ["#", "!"]               | "bananas, tomates"      |
      | "o rato roeu a roupa $ do rei % de roma" | ["%", "!"]               | "o rato roeu a roupa $ do rei" |
      | "the quick brown fox & jumped over * the lazy dog" | ["&", "*", "%", "!"] | "the quick brown fox"  |
