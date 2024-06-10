# runner.rb

require 'cucumber'
require 'rspec'
require 'httparty'
require 'json'
require 'report_builder'
require 'fileutils'
require 'date'

puts "Iniciando o runner..."

# Defina o caminho para o diretório das features
project_dir = 'C:\Teste-VR\TesteVrBackEnd\TesteVrBack'
features_dir = File.join(project_dir, 'features')

# Certifique-se de que estamos no diretório do projeto
Dir.chdir(project_dir)

# Cria o diretório reports se ele não existir
FileUtils.mkdir_p('reports')

puts "Executando o cucumber..."
# Executa o comando Cucumber para rodar todas as features
if system("bundle exec cucumber --format json --out reports/cucumber_report.json --require #{features_dir} --format pretty")
  puts "Cucumber executado com sucesso"
else
  puts "Falha na execução do Cucumber"
end

puts "Gerando relatório..."
# Gera o relatório HTML ao final da execução dos testes
at_exit do
  time = DateTime.now
  ReportBuilder.configure do |config|
    config.input_path = 'reports/cucumber_report.json'
    config.report_path = 'reports/cucumber_report'
    config.report_types = [:html]
    config.report_title = 'Teste VR - Relatório'
    config.additional_info = { 'Nome do Projeto' => 'Teste VR', 'Gerado em' => time }
  end

  puts "Gerando relatório HTML..."
  ReportBuilder.build_report

  puts "Relatório HTML gerado com sucesso em #{File.expand_path('reports/cucumber_report.html')}"
end
