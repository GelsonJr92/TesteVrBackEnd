# frozen_string_literal: true
require 'httparty'
require 'json'

Dado('que eu faço uma requisição GET para {string}') do |url|
  @response = HTTParty.get(url)
  @parsed_response = JSON.parse(@response.body)
end

Quando('eu recebo a resposta') do
  expect(@response.code).to eq(200)
end

Then('o JSON de resposta deve conter a chave {string}') do |key|
  expect(@parsed_response).to have_key(key)
end

And('eu imprimo aleatoriamente um dos tipos de estabelecimentos') do
  types = @parsed_response["typeOfEstablishment"]
  puts types.sample
end


