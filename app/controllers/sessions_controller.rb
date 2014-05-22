class SessionsController < ApplicationController
  def create
    @auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(@auth["provider"], @auth["uid"]) || User.create_with_omniauth(@auth)
    session[:user_id] = user.id
    
    token = @auth["credentials"]["token"]
    client = Google::APIClient.new
    client.authorization.access_token = token
    service = client.discovered_api('calendar', 'v3')
    @result = client.execute(
      :api_method => service.calendar_list.list,
      :parameters => {},
      :headers => {'Content-Type' => 'application/json'})
    
    #redirect_to root_url, :notice => "Signed in!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
end
end
