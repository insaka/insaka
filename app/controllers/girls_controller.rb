class GirlsController < ApplicationController

  def index
    @girls = Girl.all
  end

  def show
    @girl = Girl.find(params[:id])
  end

  def edit 
    @girl = Girl.find(params[:id])
  end

  def update
    @girl = Girl.find(params[:id])

    @girl.update(first_name: params[:first_name],
                 last_name: params[:last_name],
                 description: params[:description],
                 quote: params[:quote],
                 status: params[:status],
                 image: params[:image])

    redirect_to "/girls/#{@girl.id}"
  end
end
