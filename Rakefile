#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Tickler::Application.load_tasks

desc 'run specs for travis'
task :travis  do
  Rake::Task["app:db:create"].invoke
  Rake::Task["app:db:schema:load"].invoke
  Rake::Task["test"].invoke
end
