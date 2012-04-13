class MessagesController < ApplicationController

  # POST /messages/1/add
  def add_or_dismiss
    case params[:commit]
    
    when 'dismiss'
      message = Message.find(params[:id])
      message.destroy
  
      redirect_to root_path, notice: 'Assignment dismissed.'
      
    when 'add'
      message = Message.find(params[:id])
      current_user.tasks.create(
        :assignment => message.assignment
      )
      message.destroy      
      
      redirect_to root_path, notice: 'Assignment added to calendar.'      
    end

  end  

  # POST /messages/1/dismiss
  def dismiss
    message = Message.find(params[:id])
    message.destroy

    redirect_to root_path, notice: 'Message dismissed.'
  end  

  
  # GET /messages
  def index
    @messages = Message.all
  end

  # GET /messages/1
  def show
    @message = Message.find(params[:id])
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
    @message = Message.find(params[:id])
  end

  # POST /messages
  def create
    @message = Message.new(params[:message])

    if @message.save
      redirect_to @message, notice: 'Message was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /messages/1
  def update
    @message = Message.find(params[:id])

    if @message.update_attributes(params[:message])
      redirect_to @message, notice: 'Message was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /messages/1
  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    redirect_to messages_url
  end
end
