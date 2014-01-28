require 'resque'
require 'yaml'
require 'resque_scheduler'
require 'resque_scheduler/server'

conf = YAML.load_file(Rails.root.join('config', 'resque.yml'))

Resque.redis = conf['server'] +':'+ conf['port'] # 'localhost:6379'
Resque.redis.namespace = conf['namespace'] #'resque:SnpediaScheduler'