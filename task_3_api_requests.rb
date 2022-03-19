require "open-uri"
require 'json'
require 'benchmark'

names = ['spearow', 'ekans', 'sandshrew', 'bulbasaur', 'ivysaur', 'venusaur']

def get_pokemon_info(name)
  res = URI.open("http://pokeapi.co/api/v2/pokemon/#{name}").read
  JSON.parse(res)['weight']
end

Benchmark.bm do |x|
  x.report("one_tread:") do
    weights = names.each_with_object([]) { |name, memo| memo << get_pokemon_info(name) }
    puts "All pokemons weights: #{weights.sum}"
  end
  x.report("meany_treads:") do
    treads = []
    weights = []
    names.each { |name| treads << Thread.new { weights << get_pokemon_info(name) } }
    treads.map(&:join)
    puts "All pokemons weights from treads: #{weights.sum}"
  end
end

# ruby ./task_3_api_requests.rb
#               user       system     total        real
# one_tread:    0.219512   0.038648   0.258160 (  3.009393)
# meany_treads: 0.129178   0.017972   0.147150 (  0.519212)
#
# one_tread: All pokemons weights: 1408
# meany_treads:All pokemons weights from treads: 1408
