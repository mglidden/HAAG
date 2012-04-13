class MessagesController < ApplicationController

  # GET /messages
  def index
    @messages = Message.all
  end

  # GET /messages/1
  def show
    @message = Message.find(params[:id])
  end
  
  # POST /messages/1/add_or_dismiss
  def add_or_dismiss
    case params[:commit]
    
    when 'dismiss'
      message = Message.find(params[:id])
      message.destroy
  
      redirect_to root_path, notice: 'Assignment dismissed.'
      
    when 'add'
      message = Message.find(params[:id])
      current_user.tasks.create(:assignment => message.assignment)
      message.destroy      
      
      redirect_to root_path, notice: 'Assignment added to calendar.'      
    end
  end    

end
