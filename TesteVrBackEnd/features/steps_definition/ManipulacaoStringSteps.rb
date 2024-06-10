# frozen_string_literal: true
require 'httparty'
require 'json'
  def remove_text_after_markers(string, markers)
    regex = Regexp.union(markers)
    string.split(regex).first.strip
  end

Dado('a string de entrada {string}') do |string|
    @string = string
  end

E(/^os marcadores (.*)$/) do |markers|
    @markers = eval(markers)
end

Quando('eu removo o texto após os marcadores') do
    @output = remove_text_after_markers(@string, @markers)
end

Entao('a saída esperada é: {string}') do |expected_output|
    expect(@output).to eq(expected_output)
end
# Path: features/steps_definition/ManipulacaoStringSteps.rb

