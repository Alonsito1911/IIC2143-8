class ChatsController < ApplicationController
  def index
    @chats = Chat.all
  end 

  def show
    @user = User.find(params[:id])
  end
    
  def new
    @chat = Chat.new
  end
      

  def create
    @chat = Chat.new(user1:chat_params[:user1].to_i, user2:chat_params[:user2].to_i, 
                     mensajes:chat_params[:mensajes])
  
      if @chat.save
        redirect_to inchat_chat_path(@chat), notice: 'Chat creado exitosamente.'
      else
        render :new
      end
  end

  def inchat
    @chat = Chat.find(params[:id])
  end

  def edit
    @chat = Chat.find(params[:id])
  end

  def update
    @chat = Chat.find(params[:id].to_i)
    puts 'usuario =', params[:chat][:mensajes] 
      @msg = JSON.parse(@chat.mensajes)
      @msg.push([params[:chat][:user1],params[:chat][:mensajes]])
      
      if @chat.update(user1:@chat.user1, user2:@chat.user2, mensajes:@msg.to_json)
        redirect_to inchat_chat_path(@chat), notice: 'Chat actualizado exitosamente.'
      else
        render :edit
      end
  end

  def chat_params
    params.require(:chat).permit(:user1, :user2, :mensajes)
  end
end
