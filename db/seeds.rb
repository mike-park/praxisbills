# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

require 'csv'
require 'ap'

CSV.foreach(File.expand_path('../therapy.csv', __FILE__),
            :col_sep => ';') do |row|
  row[1].sub!(',','.')
  Therapy.create!(:code => row[0],
                  :price => row[1],
                  :short_description => row[2],
                  :description => row[3],
                  :valid_from => '2010-03-01')
end
