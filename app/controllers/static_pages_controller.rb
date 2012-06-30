class StaticPagesController < ApplicationController
  def view
    begin
      render params[:page]
    rescue
      not_found
    end
  end
end
