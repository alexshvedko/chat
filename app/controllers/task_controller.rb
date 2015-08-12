class TaskController < WebsocketRails::BaseController

  def initialize_session
    # perform application setup here
    controller_store[:message_count] = 0
  end

  def create
    # The `message` method contains the data received
    # task = Task.new message
    # if task.save
      send_message :create_success, message, :namespace => :tasks
    # else
    #   send_message :create_fail, task, :namespace => :tasks
    # end
  end

end
