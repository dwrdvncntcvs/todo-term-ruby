require "bundler/setup"
require_relative "./Todo/app/todo.rb"

Todo::Client.new.start