puts 'inicializa el service'
conn = Bunny.new(ENV.fetch('QUEUE_URL'))
conn.start
channel = conn.create_channel
delete_post_exchange = channel.fanout('aspost.delete_post')

channel.queue('listen.delete_post', :auto_delete => true)
  .bind(delete_post_exchange).subscribe do |delivery_info, metadata, payload|
    puts '*' * 10
    JSON.parse(payload)
    puts '*' * 10
end
