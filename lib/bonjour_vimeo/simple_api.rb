module BonjourVimeo
  module SimpleApi

    include HTTParty
    base_uri 'vimeo.com/api/v2'
    format  :json

    ##============================================================##
    ## Making an Video Request
    ##============================================================##
    def self.user(username="vimeo",request="info")
      available_request= ['info', 'videos', 'likes', 'appears_in', 'all_videos', 'subscriptions', 'albums', 'channels', 'groups']
      if !available_request.include? request
        request="info"
      end
      response = get("/#{username}/#{request}.#{format}")
      case response.code
      when 200
        response
      when 404
        response=response.code
      when 500...600
        response= "ERROR : #{response.code}"
      end
    end

    ##============================================================##
    ## Making an Video Request
    ##============================================================##
    def self.video(video_id)
      response = get("/video/#{video_id}.#{format}")
      case response.code
      when 200
        thumbnail_base=response[0]['thumbnail_small'].split('_100')
        response[0]['status']=true
        response[0]['thumbnail_custom']="#{thumbnail_base[0]}_295#{thumbnail_base[1]}"
        response
      when 404
         response = [{'status'=> false}]
      when 500...600
        response= "ERROR : #{response.code}"
      end
    end


    ##============================================================##
    ## Making an Activity Request
    ##============================================================##
    def self.activity(username="vimeo",request="user_did")
      available_request= ['user_did','happened_to_user','contacts_did','everyone_did']
      if !available_request.include? request
        request="user_did"
      end
      response = get("/activity/#{username}/#{request}.#{format}")
      case response.code
      when 200
        response
      when 404
        response=response.code
      when 500...600
        response= "ERROR : #{response.code}"
      end
    end


    ##============================================================##
    ## Making a Group Request
    ##============================================================##
    def self.group(group_name="highdefinition",request="videos")
      available_request= ['videos','users','info']
      if !available_request.include? request
        request="videos"
      end
      response = get("/group/#{group_name}/#{request}.#{format}")
      case response.code
      when 200
        response
      when 404
        response=response.code
      when 500...600
        response= "ERROR : #{response.code}"
      end
    end


    ##============================================================##
    ## Making a Channel Request
    ##============================================================##
    def self.chanel(chanel_name="541696",request="videos")
      available_request= ['videos','info']
      if !available_request.include? request
        request="videos"
      end
      response = get("/channel/#{chanel_name}/#{request}.#{format}")
      case response.code
      when 200
        response
      when 404
        response=response.code
      when 500...600
        response= "ERROR : #{response.code}"
      end
    end


    ##============================================================##
    ## Making an Album Request
    ##============================================================##
    def self.album(album_id="123",request="videos")
      available_request= ['videos','info']
      if !available_request.include? request
        request="videos"
      end
      response = get("/album/#{album_id}/#{request}.#{format}")
      case response.code
      when 200
        response
      when 404
        response=response.code
      when 500...600
        response= "ERROR : #{response.code}"
      end
    end

  end
end
