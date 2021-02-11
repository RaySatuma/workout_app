module ApplicationHelper
    require 'active_support'
    require "uri"
 
    def text_url_to_link text
 
        URI.extract(text, ['http','https'] ).uniq.each do |url|
          sub_text = ""
          sub_text << "<a href=" << url << " target=\"_blank\">" << url << "</a>"
       
          text.gsub!(url, sub_text)
        end
       
        return text
      end

      


      def youtube_embed(youtube_url)
        if youtube_url[/youtu\.be\/([^\?]*)/]
          youtube_id = $1
        else
          # Regex from # http://stackoverflow.com/questions/3452546/javascript-regex-how-to-get-youtube-video-id-from-url/4811367#4811367
          youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
          youtube_id = $5
        end
      
        %Q{<iframe title="YouTube video player" width="640" height="390" src="http://www.youtube.com/embed/#{ youtube_id }" frameborder="0" allowfullscreen></iframe>}
      end
      
      def youtube_video?(url) 
        self.posts.content.include?(url)
      end     
end
