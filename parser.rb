#!/usr/bin/env ruby
# frozen_string_literal: true

require 'optparse'
require 'logger'

$LOAD_PATH.unshift File.join(File.dirname(__FILE__), 'lib')

require 'visits'
require 'queries/popular_routes'
require 'queries/revisited_routes'
require 'queries/unique_visitors'
require 'queries/unique_visitors_for'
require 'queries/visits_per_visitor'
require 'queries/history_for'

logger = Logger.new($stdout)

queries = {
  popular_routes: { query: PopularRoutes, header: 'Popular routes' },
  revisited_routes: { query: RevisitedRoutes, header: 'Routes revisited by at least one visitor' },
  unique_visitors: { query: UniqueVisitors, header: 'Unique visitors for all routes' },
  unique_visitors_for: { query: UniqueVisitorsFor, header: 'Unique visitors for a given route' },
  visits_per_visitor: { query: VisitsPerVisitor, header: 'Visits per visitor' },
  history_for: { query: HistoryFor, header: 'History for a given visitor' }
}

options = {}

command_parser = OptionParser.new do |opt|
  opt.banner = 'Usage: ./parser.rb [-p] [-r] [-u ROUTE] [-v] [-h VISITOR] file1 file2 ...'
  opt.on('-p', '--popular_routes', 'Run the Popular Routes query')
  opt.on('-r', '--revisited_routes', 'Run the Revisited Routes query')
  opt.on('-u', '--unique_visitors', 'Run the Unique Visitors for all routes query')
  opt.on('-f', '--unique_visitors_for ROUTE', 'Run the Unique Visitors query for a given route')
  opt.on('-v', '--visits_per_visitor', 'Run the Revisits per Visitor query')
  opt.on('-h', '--history_for VISITOR', 'Run the History For query for a given visitor')
end

begin
  command_parser.parse!(into: options)
rescue OptionParser::InvalidOption => e
  logger.warn e.message.gsub('invalid', 'Unrecognised')
  exit(1)
end

if options.empty?
  logger.warn 'Please specify one or more queries to run'
  exit(1)
end

if ARGV.length.zero?
  logger.warn 'Please supply one or more logfiles to parse'
  exit(1)
end

visits = Visits.new
ARGV.each do |logfile|
  visits.parse(logfile)
rescue Errno::ENOENT
  logger.warn "Could not find file '#{logfile}' to parse"
  exit(1)
end

options.each do |flag, argument|
  query = queries[flag]
  logger.info query[:header]
  query[:query].query(visits, argument.to_s.to_sym, logger: logger)
end
