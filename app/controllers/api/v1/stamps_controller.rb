class Api::V1::StampsController < Api::V1::BaseController


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

end