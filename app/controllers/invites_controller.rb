class InvitesController < ApplicationController
  def create
    mandrill = Mandrill:API.new(MANDRILL_API)

    message = {

    }

    mandrill.messages.send message
  end
end
