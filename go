#!/usr/bin/env ruby

lib_dir = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift lib_dir
Dir["#{lib_dir}/**/*.rb"].each {|file| require File.basename(file) }

Main.start

