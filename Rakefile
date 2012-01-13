#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Tickler::Application.load_tasks

desc 'run specs for travis'
task :travis  do
  cp File.expand_path('../config/database.yml.postgresql', __FILE__), File.expand_path('../config/database.yml', __FILE__)
  Rake::Task["db:create"].invoke
  Rake::Task["db:schema:load"].invoke
  Rake::Task["test"].invoke
end

desc 'run specs for jenkins'
task :jenkins  do
  cp File.expand_path('../config/database.yml.sqlite', __FILE__), File.expand_path('../config/database.yml', __FILE__)
  Rake::Task["db:create"].invoke
  Rake::Task["db:schema:load"].invoke
  Rake::Task["test"].invoke
end
