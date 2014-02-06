require 'resque/tasks'
require 'resque/pool/tasks'
require 'resque_scheduler/tasks'

task 'resque:setup' => :environment do

  ENV['QUEUE'] = '*'

end

task 'resque:pool:setup' do

  # Close any sockets or files in pool manager
  ActiveRecord::Base.connection.disconnect!

  Resque::Pool.after_prefork do |job|

    Resque.redis.client.reconnect
    # and re-open them in the resque worker parent
    ActiveRecord::Base.establish_connection

  end
end