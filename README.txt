Author:: Wen-Tien Chang(mailto:ihower@handlino.com)
Copyright:: Copyright (c) 2008 Handlino Inc.
Licensed under the MIT: http://www.opensource.org/licenses/mit-license.php

== Description ==
FaceboxRender plugin let you use lightbox seamlessly using Facebox library.
http://handlino.com/blog/2008/02/26/57/

== Install ==
 * download from http://github.com/ihower/facebox_render/
 * uncompress to /vendor/plugins/facebox_render
 
 Note that you must install Facebox first(see http://famspam.com/facebox/).
 
 1.Download jQuery (or you can try to install http://ennerchi.com/projects/jrails to replace Prototype library totally)
 2.Download facebox
 3.Copy facebox js file to /public/javascripts/
 4.Copy facebox css file to /public/styleshees/
 5.Copy facebox all image files to /public/facebox/
 6.Config your layout (stylesheet_link_tag and javascript_include_tag) to add these js,css files

= USAGE =

== Helper ==
We have facebox_link_to helper (it's will launch loading facebox first, send ajax request second)
or you can use link_to_remote, form_remote_tag...etc Ajax helper.
Don't use <a href="somelink" ref="facebox">

== Controller ==
Add "include FaceboxRender" to your controller, 
or simply put it at /app/controllers/application.rb

Then in your action:

respond_to do |format|
 format.html
 format.js { render_to_facebox }
end

By Default render the html without layout,
otherwise you can pass options[:template], options[:action], options[:partial] or options[:html] string.
Passing options[:msg] will pulsate a message.

If block given, it will yield after facebox script, eg:
  
render_to_facebox do |page|
  page << "alert('test')"
end

Besides render_facebox, we have close_facebox, redirect_from_facebox.

respond_to do |format|
 format.html
 format.js { close_facebox }
end