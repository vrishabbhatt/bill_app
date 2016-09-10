class StaticPagesController < ApplicationController
  def sample_page
  end

  def sample_form
  	@bill = Bill.new
  end
end
