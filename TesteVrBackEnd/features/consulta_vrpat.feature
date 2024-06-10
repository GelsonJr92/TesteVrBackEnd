# language: pt
Funcionalidade: Consulta de produtos e estabelecimentos

  Cenario: : Validação da chave "typeOfEstablishment" e impressão de um tipo de estabelecimento
    Dado que eu faço uma requisição GET para "https://portal.vr.com.br/api-web/comum/enumerations/VRPAT"
    Quando eu recebo a resposta
    Entao o JSON de resposta deve conter a chave "typeOfEstablishment"
    E eu imprimo aleatoriamente um dos tipos de estabelecimentos
