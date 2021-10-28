class AuditionsController < ApplicationController
  def new
    @audition = Audition.new
  end

  def create
    @audition = Audition.new(audition_params)
  end

  private
  def audition_params
    params.require(:audition).permit!
    if @audition.save
      redirect_to root_path
    end
  end
end
