# Webserver log parser

This tool takes one or more predefined queries and one or more webserver log
files and runs simple queries on the data to produce insights from the raw logs.

## Running the tool

The following output was produced by running `./parser.rb --help`

```
Usage: parser.rb [-p] [-r] [-u ROUTE] [-v] file1 file2 ...
    -p, --popular_routes             Run the Popular Routes query
    -r, --revisited_routes           Run the Revisited Routes query
    -u, --unique_visitors            Run the Unique Visitors for all routes query
    -f, --unique_visitors_for ROUTE  Run the Unique Visitors query for a given route
    -v, --visits_per_visitor         Run the Revisits per Visitor query
    -h, --history_for VISITOR        Run the History For query for a given visitor
```

## Logfile format

The format of the input logfile(s) must be one line per request, with the format
`<route> <ipv4>`

Example:

```
/path/subpath/1 001.002.003.004
/otherpath/othersubpath/2 005.006.007.008
/newpath 009.010.011.012
```

## Queries

Each of the following queries can be run either on their own or in conjunction
with other queries. Just add the required switches to the command to run the
relevant query

### Popular routes

`-p | --popular_routes`

All routes, sorted by total visits, then alphabetically

### Revisited routes

`-r | --revisited_routes`

All routes that have been revisited by at least one visitor, along with how many
unique revisitors and how many total revists

### Unique visitors

`-u | --unique_visitors`

All routes, with a count of how many visitors were unique

### Unique visitors for route

`-f | --unique_visitors_for ROUTE`

One given route, with a count of how many visitors were unique

### Visits per visitor

`-v | visits_per_visitor`

Each visitor, along with how many visits they made, and how many of those visits
were to unique routes

### History for visitor

`-h | --history_for VISITOR`

One visitor, with their route history in the same order as the logs

## Requirements

This tool is built using Ruby 2.7.1. All dependencies can be installed by
running `bundle install`

## Running the tests

The tests for this tool are written using the RSpec framework. Run the tests
with `bundle exec rspec`.

Rubocop is also available with `bundle exec rubocop`, and Reek with
`bundle exec reek`.
