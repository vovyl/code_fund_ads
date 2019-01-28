Flipper.configure do |config|
  config.default do
    adapter = Flipper::Adapters::ActiveRecord.new
    Flipper.new(adapter)
  end
end

# To enable a group and feature, run in the irb console:

# Flipper.register(:admins) do |actor|
#   actor.respond_to?(:administrator?) && actor.administrator?
# end

# Flipper.instance[:jobs].enable_group :admins
