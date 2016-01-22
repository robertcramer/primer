class InvitesController < ApplicationController
  def create
    mandrill = Mandrill::API.new ENV["MANDRILL_API_KEY"]

    message = {
        text: "testing 123. Testing 123.",
        subject: "this is a test!",
        from_email: "andrewkfaircloth@gmail.com",
        to: [{email: "robertbcramer@icloud.com"}]
    }

    mandrill.messages.send message
  end
end
