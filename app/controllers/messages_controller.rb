class MessagesController < ApplicationController
  def index
    @users = User.all
    @messages = Message.all
  end

  def create
    # byebug
    @message = Message.create!(params.require(:message).permit(:content))
    PrivatePub.publish_to("/messages/new", message: @message.to_json)
  end
end
