module IntegrationSpecHelper
  def login(user)
    visit "/auth/google"
  end
end