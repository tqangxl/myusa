class UnsubscribeController < ApplicationController

  def unsubscribe
    delivery_method = params[:delivery_method]
    user = User.find_by_email(params[:email])
    raw_token = params[:token]

    if token = UnsubscribeToken.unsubscribe(user, raw_token, delivery_method)
      @application = token.notification.app
    else
      redirect_to root_path
    end
  end

end
