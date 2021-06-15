class PagesController < ApplicationController
  def about
    @heading = 'Dev by Me!'
    @body = 'Pavlyuk Alexsandr Petrovich\nIVT-18-2'
  end
end
