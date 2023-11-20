class Initialize
  def self.init_cache(args = {})
    args[:port] ||= 6379
    @@expire = args[:expire] ||= 60 * 5 # sec * min
    raise StandardError('url is empty') if args[:url].nil?
    @@redis_pool = ConnectionPool::Wrapper.new(size: 5, timeout: 5) do
      Redis.new(host: host, port: args[:port])
    end
  end
end
