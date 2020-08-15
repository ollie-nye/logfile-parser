#!/usr/bin/env ruby
# frozen_string_literal: true

require 'optparse'

$LOAD_PATH.unshift File.join(File.dirname(__FILE__), 'lib')

require 'visits'
require 'queries/popular_routes'
require 'queries/revisited_routes'
require 'queries/unique_visitors'
require 'queries/unique_visitors_for'
require 'queries/visits_per_visitor'
require 'queries/history_for'

queries = {
  popular_routes: { query: PopularRoutes, header: 'Popular routes' },
  revisited_routes: { query: RevisitedRoutes, header: 'Routes revisited by at least one source' },
  unique_visitors: { query: UniqueVisitors, header: 'Unique visitors for all routes' },
  unique_visitors_for: { query: UniqueVisitorsFor, header: 'Unique visitors for a given route' },
  visits_per_visitor: { query: VisitsPerVisitor, header: 'Visits per visitor' },
  history_for: { query: HistoryFor, header: 'History for a given visitor' }
}

options = {}

OptionParser.new do |opt|
  opt.banner = 'Usage: parser.rb [-p] [-r] [-u ROUTE] [-v] file1 file2 ...'
  opt.on('-p', '--popular_routes', 'Run the Popular Routes query') { options[:popular_routes] = true }
  opt.on('-r', '--revisited_routes', 'Run the Revisited Routes query') { options[:revisited_routes] = true }
  opt.on('-u', '--unique_visitors', 'Run the Unique Visitors for all routes query') { options[:unique_visitors] = true }
  opt.on('-f', '--unique_visitors_for ROUTE', 'Run the Unique Visitors for a given route query') { |r| options[:unique_visitors_for] = r }
  opt.on('-v', '--visits_per_visitor', 'Run the Revisits per Visitor query') { options[:visits_per_visitors] = true }
end.parse!

if options == {}
  puts 'Please choose one or more queries to run'
  puts
  exit(1)
end

if ARGV.length.zero?
  puts 'Please supply one or more logfiles to parse'
  exit(1)
end

visits = Visits.new
ARGV.each do |logfile|
  visits.parse(logfile)
end

options.each do |flag, argument|
  query = queries[flag]
  result = query[:query].query(visits, argument)
  puts query[:header]
  puts result
  puts "\n\n"
end
