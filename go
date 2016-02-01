#!/usr/bin/env ruby

lib_dir = File.expand_path('lib', File.dirname(__FILE__))
Dir["#{lib_dir}/**/*.rb"].each {|file| require file }

Main.start

