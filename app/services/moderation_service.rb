require 'bunny'

class ModerationService
  def self.send_content(content)
    body = {content: content}.to_json
    conn = connection
    conn.start
    channel = conn.create_channel
    exchange = channel.fanout('aspost.moderation')
    exchange.publish(body)
  end

  def self.connection
    Bunny.new(ENV.fetch('QUEUE_URL'))
  end
end

