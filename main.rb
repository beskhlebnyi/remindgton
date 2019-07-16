require 'telegram/bot'
require 'dotenv/load'

token =  ENV['BOT_API_TOKEN']

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    Thread.start(message) do |message|
      case message.text
      when '/start'
        bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
      when '/stop'
        bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
      else '/map'
        bot.api.send_message(chat_id: message.chat.id, text: "I have no idea what this command means")
      end
    end
  end
end
