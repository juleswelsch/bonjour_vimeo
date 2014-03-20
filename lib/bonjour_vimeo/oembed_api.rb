module BonjourVimeo
  module OembedApi

    include HTTParty
    format= 'json'
    base_uri=  "vimeo.com/api/oembed.#{format}"


    def self.embed(video_id,autoplay=false,byline=false,title=false,color="fa6132",portrait=false,loop=false)
      response = get ("http://vimeo.com/api/oembed.json?url=http%3A//vimeo.com/#{video_id}Video&width=640&autoplay=#{autoplay}&byline=#{byline}&title=#{title}&portrait=#{portrait}&color=#{color}&loop=#{loop}&api=1")
      case response.code
      when 200
        response['status']=true
        response
      when 404
          response = {'status'=> false}
      when 500...600
        response = {'status'=> response.code}
      end
    end

  end
end
