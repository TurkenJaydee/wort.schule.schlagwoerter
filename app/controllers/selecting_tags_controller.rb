class SelectingTagsController < ApplicationController
  def index
    @chat_response = ChatgptService.call('What is your name?') end
  end
