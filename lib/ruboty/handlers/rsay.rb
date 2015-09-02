require 'ruboty'
require 'aws-sdk'

module Ruboty
  module Handlers
    class Rsay < Base
      env :RSAY_QUEUE_URLS, "SQS queue URLs for rsay command (e.g. 'living:https://sqs.region.amazonaws.com/123456789/rsay-living,bedroom:https://sqs.region.amazonaws.com/123456789/rsay-bedroom')"

      on(
        /rsay "(?<message>[^"]+)" to (?<to>.+)/,
        name: 'say',
        description: 'Say remotely'
      )

      def say(message)
        sqs.send_message(
          queue_url: queue_url_for(message[:to]),
          message_body: {"Message" => message[:message]}.to_json,
        )

        message.reply('OK')
      rescue
        message.reply('Error')
        raise
      end

      private

      def sqs
        @sqs ||= Aws::SQS::Client.new
      end

      def queue_url_for(name)
        queue_urls[name]
      end

      def queue_urls
        @queue_urls ||= Hash[ENV['RSAY_QUEUE_URLS'].split(',').map {|kv| kv.split(':', 2) }]
      end
    end
  end
end
