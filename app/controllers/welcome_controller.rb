class WelcomeController < ApplicationController
  def index
    render json: "{
    Welcome to Sweater Weather, a Module 3 project at Turing School of Software and Design.
    - Brian Plantico, GitHub: @bplantico
     }"
  end
end
