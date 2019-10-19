class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new message_params
    if @message.valid?
      MessageMailer.contact_me(@message).deliver_now
      redirect_to new_message_url
      flash[:notice] = t ".received"
    else
      flash[:notice] = t ".error"
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:name, :email, :body)
  end
end
