#!/usr/bin/env ruby
require File.expand_path('../../config/environment.rb', __FILE__)
require 'csv'

# load therapy.csv into table therapies
# script argument is the pricelist note. start_date is considered today

# ignore lines with a price of null

note = ARGV.shift
filename = ARGV.shift
unless note && filename
  puts "usage: loadpricelist.rb 'pricelist note' file.csv"
  exit -1
end

Pricelist.transaction do
  pl = Pricelist.create!(:note => note, :start_date => Date.today)
  puts "Pricelist #: #{pl.id}"

  count = 0
  CSV.foreach(filename, :col_sep => ';') do |row|
    next if row[0] == 'Code'	# ignore header line
    next if row[1].nil?
    row[1].sub!(',','.')
    Therapy.create!(:pricelist => pl,
                    :code => row[0],
                    :price => row[1],
                    :short_description => row[2],
                    :description => row[3])
    count += 1
  end
  puts "#{count} therapies added"
end
