require 'flipper/adapters/redis'

options = {
  url: 'redis://127.0.0.1'
}

# this works
adapter = Flipper::Adapters::Redis.new(Redis.new(options))

# this does not work
# adapter = Flipper::Adapters::Redis.new(Redis::Namespace.new('test_flipper', redis: Redis.new(options)))

Flipper.configure do |config|
  config.default { Flipper.new(adapter) }
end

features = %w[foo bar baz]

features.each { |feature| Flipper.add feature }
