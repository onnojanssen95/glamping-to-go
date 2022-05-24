class GlampingSetsController < ApplicationController

  def index
    @glamping_set = Glamping_set.all
  end


end

