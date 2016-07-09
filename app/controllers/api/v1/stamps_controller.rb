class Api::V1::StampsController < Api::V1::BaseController
  include StampsHelper

  def show
    stamp = Stamp.find(params[:id])
    render(json: Api::V1::StampSerializer.new(stamp).to_json)
  end


  def index
    stamps = Stamp.all

    render(
        json: ActiveModel::ArraySerializer.new(
            stamps,
            each_serializer: Api::V1::StampSerializer,
            root: 'stamps',
        )
    )
  end


  def search
    stamps = Stamp.search(params[:q]).records
    render(
        json: ActiveModel::ArraySerializer.new(
            stamps,
            each_serializer: Api::V1::StampSerializer,
            root: 'stamps',
        )
    )
  end


  def set
    puts "entering set".colorize(:red)
    stamp = Stamp.find(params[:id])
    stamps = find_stamps_in_set_with(stamp)
    render(
        json: ActiveModel::ArraySerializer.new(
            stamps,
            each_serializer: Api::V1::StampSerializer,
            root: 'stamps',
        )
    )
  end


end