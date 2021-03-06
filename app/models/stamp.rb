class Stamp < ActiveRecord::Base
=begin
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  #Stamp.__elasticsearch__.client = Elasticsearch::Client.new #host: '192.168.99.100', log: true

  def self.search(query)
    __elasticsearch__.search(
        {
            query: {
                multi_match: {
                    query: query,
                    fields: ['computed_description^10', 'country_name', 'sg_number^5']
                }
            },
            highlight: {
                pre_tags: ['<em class="label label-highlight">'],
                post_tags: ['</em>'],
                fields: {
                    title:   { number_of_fragments: 0 },
                    content: { fragment_size: 25 }
                }
            }
        }
    )
  end


end

Stamp.import force:true # for auto sync model with elastic search
=end

end
