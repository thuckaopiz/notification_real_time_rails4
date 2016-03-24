class ChatController < ApplicationController
  include Tubesock::Hijack
  # before_action :authenticate_user!

  def chat
    send_message nil, "chat"
  end

  def other_chat
    send_message nil, "other_chat"
  end

  def index
    @users = User.all
  end

  def sign_out
    send_message current_user.to_json, "sign_out"
  end

  def sign_in
  end

  def create_article
    send_message current_user.to_json, "create_article"
  end

  def send_message message=nil, channel_name
    hijack do |tubesock|
      redis_thread = Thread.new do
        Redis.new.subscribe channel_name do |on|
          on.message do |channel, message|
            tubesock.send_data message
          end
        end
      end

      tubesock.onmessage do |m|
        m = message==nil ? m : message
        Redis.new.publish channel_name, m
      end

      tubesock.onclose do
        redis_thread.kill
      end
    end
  end
end
