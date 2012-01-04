module ApplicationHelper
  
  def show_logo
    params[:logo_size] = params[:logo_size] == "#{:thumb}" ? params[:logo_size] = "#{:tiny}" :  params[:logo_size] = "#{:thumb}"
    logo_css_class = params[:logo_size] == "#{:tiny}" ? "current asc" : "current desc"
    link_to 'Logo' , {:logo_size => params[:logo_size] }, {:class => logo_css_class} 
  end

  def sortable(column, title = nil)
    title ||= column.titleize # make it look pretty
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == 'asc' ? 'desc' : 'asc'
    link_to title, { :sort => column, :direction => direction } , {:class => css_class}
  end
  	
	def show_photo(userp,size)
	  if userp.avatar.file?
		  image_tag userp.avatar.url(size)
	  else
		  data = 'No Photo on file'
    end	
  end


  # Based on https://gist.github.com/1205828, in turn based on https://gist.github.com/1182136
  # Required to make Twitter’s Bootstrap CSS framework work with Will_paginate
  
   class BootstrapLinkRenderer < ::WillPaginate::ActionView::LinkRenderer
     protected

     def html_container(html)
       tag :div, tag(:ul, html), container_attributes
     end

     def page_number(page)
       tag :li, link(page, page, :rel => rel_value(page)), :class => ('active' if page == current_page)
     end

     def gap
       tag :li, link(super, '#'), :class => 'disabled'
     end

     def previous_or_next_page(page, text, classname)
       tag :li, link(text, page || '#'), :class => [classname[0..3], classname, ('disabled' unless page)].join(' ')
     end
   end

   def page_navigation_links(pages)
     will_paginate(pages, :class => 'pagination', :inner_window => 2, :outer_window => 0, :renderer => BootstrapLinkRenderer, :previous_label => '&larr;'.html_safe, :next_label => '&rarr;'.html_safe)
   end


	
end
