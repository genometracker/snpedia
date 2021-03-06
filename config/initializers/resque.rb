require 'resque'
require 'yaml'
require 'resque_scheduler'
require 'resque_scheduler/server'

conf = YAML.load_file(Rails.root.join('config', 'resque.yml'))

Resque.redis = conf['server'] +':'+ conf['port'].to_s
Resque.redis.namespace = conf['namespace']

unless conf['schedules']==nil
  Resque.schedule = conf['schedules']
end

