module FaceboxRenderHelper

  def facebox_link_to(name, options = {}, html_options = nil)
    link_to_function(name, "jQuery.facebox(function(){ jQuery.ajax({data:'authenticity_token=' + encodeURIComponent('#{options[:authenticity_token]}'), dataType:'script', type:'#{options[:method]}', url:'#{options[:url]}'})})", html_options || options.delete(:html))
  end

end