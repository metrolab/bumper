#!/usr/bin/env ruby
# encoding: utf-8

require 'rubygems'
require "json"
require 'erb'
require 'micro-optparse'

require_relative 'helpers/string'
require_relative 'helpers/flag'
require_relative 'helpers/flags'

def show_error(error_string)
  puts 'Error!'.red
  puts error_string
  exit -1
end

def generate_flags(destination_folder)
	puts "Writing on: #{destination_folder}".cyan
	input_file = File.open("templates/bumper_flags.erb", "rb")
	template = input_file.read
	input_file.close
	renderer = ERB.new(template)
	output = renderer.result()
	output_file = File.new(destination_folder+"BumperFlags.swift", "w")
	output_file.write(output)
	output_file.close
end


def read_flags(source_json)
	puts "Processing: #{source_json}".cyan

end

# Parsing and commandline checks

show_error 'No parameters specified. Use the flag --help to see them all.' unless ARGV.size > 0

options = Parser.new do |p|
  p.banner = 'flags_generator (c) 2016 Letgo <eli.kohen@letgo.com>'
  p.version = '0.1'
  p.option :source, 'Json definition source', :default => '', :short => 's'
  p.option :destination, 'Generated file destination folder', :default => '', :short => 'd'
end.process!

source_json = options[:source]
destination_folder = options[:destination]

show_error "File #{source_json} doesn't exist" unless File.file?(source_json)
show_error "Folder #{destination_folder} doesn't exist" unless File.exist?(destination_folder)

# @flags = read_flags(source_json)
flag1 = Flag.new("FlagTest1", ["value1", "value2", "value3"], "value1", "Flag Test 1")
flag2 = Flag.new("FlagTest2", ["value1", "value2", "value3"], "value1", "Flag Test 2")
flag3 = Flag.new("FlagTest3", ["value1", "value2", "value3"], "value1", "Flag Test 3")
@flags = Flags.new([flag1, flag2, flag3])
generate_flags(destination_folder)
