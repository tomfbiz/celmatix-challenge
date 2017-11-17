# Controller used to render "Static" pages
class PagesController < ApplicationController
  # renders page passed in via <tt>params[:page]</tt>
  #
  # +page+ corresponds to a view in the +views/pages+ directory
  def show
    render template: "pages/#{params[:page]}"
  end
end
