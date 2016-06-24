require 'elasticsearch/model'

class Stamp < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  Stamp.__elasticsearch__.client = Elasticsearch::Client.new host: '192.168.99.100'
end
Stamp.import force:true # for auto sync model with elastic search