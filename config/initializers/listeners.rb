puts 'inicializa el listener'
conn = Bunny.new(ENV.fetch('QUEUE_URL'))
conn.start
channel = conn.create_channel
x = channel.default_exchange

channel.queue('listen.delete_post', :auto_delete => true).subscribe do |delivery_info, metadata, payload|
    puts '*' * 10
    puts JSON.parse(payload)
    puts '*' * 10
end
