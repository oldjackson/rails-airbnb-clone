require "open-uri"

class FlatsController < ApplicationController
  before_action :load_flats

  def index
    load_flats
  end

  def show
    @flat = @flats[params[:id].to_i]
  end

  private

  def load_flats
    dict_url = "https://raw.githubusercontent.com/lewagon/flats-boilerplate/master/flats.json"
    resp_serialized = open(dict_url).read
    @flats = JSON.parse(resp_serialized)
  end
end
