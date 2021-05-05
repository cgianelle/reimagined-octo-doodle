require 'sidekiq'

# why the client and server in the same file?
Sidekiq.configure_client do |config|
    config.redis = { db: 1 }
end

Sidekiq.configure_server do |config|
    config.redis = { db: 1 }
end

class OurWorker
    include Sidekiq::Worker

    def perform(complexity)
        case complexity
        when "super_hard"
            sleep 20
            puts "That was super hard"
        when "hard"
            sleep 10
            puts "that was hard"
        else
            sleep 1
            puts "that was pretty easy"
        end
    end
end