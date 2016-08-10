require 'uri'
require 'net/http'
require 'colorize'
require 'json'

pid = ''


at_exit do
  print 'Shutting down app server...'
  sleep(3)
  puts
  print 'Shutting down ElasticSearch...'
  puts ('    (pid=' + pid + ')').colorize(:yellow) unless pid.nil?
  pid = `ps ax | grep elastic`.split(' ')[0] if pid.nil?
  if pid
    system("kill " + pid)
  end
end


system('clear')
puts
puts ('*'*80).colorize(:white).bold
puts "Starting X E N A".colorize(:white).bold
puts ('*'*80).colorize(:white).bold
puts '    Initializing...'
puts
puts


puts 'Start an ElasticSearch service'.colorize(:white).bold
puts ('-'*80).colorize(:white).bold
print '    Checking if ElasticSearch is running on http://localhost:9200...'

begin
  ping = Net::HTTP.get(URI.parse('http://localhost:9200'))
  puts '... it IS running. Off you go.'
rescue
  puts '... it is NOT running.'.colorize(:red)
  print '    Let me start it up for you now...'
  system("./vendor/elasticsearch-1.0.1/bin/elasticsearch -d")
  sleep(5)  # wait for ES to inflate
  pid = `ps ax | grep elastic`.split(' ')[0]
  puts '    Done.'.colorize(:green).bold + (' ElasticSearch pid=' + pid).colorize(:yellow)
end
puts
puts


puts 'Seed the database'.colorize(:white).bold
puts ('-'*80).colorize(:white).bold
system("rake  db:seed")
puts '    (This should have updated the ElasticSearch index, too.)'.colorize(:yellow)
puts
puts


puts 'Make sure the index got created/updated'.colorize(:white).bold
puts ('-'*80).colorize(:white).bold
puts '    Trying http://localhost:9200/stamps/_search...'
begin
  results = Net::HTTP.get(URI.parse('http://localhost:9200/stamps/_search'))
  obj = JSON.parse(results)
  hits = obj['hits']
  total = hits['total'].to_s
  if total.to_i > 0
    puts "    Ok, index was created as expected.".colorize(:green)
  else
    puts "    Well, Chip's code doesn't work. :-(".colorize(:red)
  end
rescue
  puts "Ooops.  Boom.".colorize(:red).bold
end
puts
puts


puts 'Enrich the stamp data'.colorize(:white).bold
puts ('-'*80).colorize(:white).bold
system("rake  enrich_catalog_data")
puts
puts


puts 'Launch the app server'.colorize(:white).bold
puts ('-'*80).colorize(:white).bold
system("rails s -b 0.0.0.0 -p 3000")
puts
puts

