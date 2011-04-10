module ApplicationHelper
  def current_class?(test_path, extra='')
    return ('current'+extra) if request.fullpath == test_path
    ''
  end
  
  def menu_image?(imageurl, test_path)
    if request.fullpath == test_path
      return "menu/" + imageurl + "-w.png"
    else
      return "menu/" + imageurl + ".png"
    end
  end
  
  def menu_item(test_path, imageurl, alttag, last=false)
    if last
      menu_output = '<li class="last ' + current_class?(test_path, "2") + '">'
    else
      menu_output = '<li class="' + current_class?(test_path) + '">'
    end
    menu_output = menu_output + (link_to image_tag(menu_image?(imageurl, test_path), :alt => alttag), test_path)
    menu_output = menu_output + '</li>'
    return  menu_output 
  end
  
  def admin_show_btn
    return image_tag('icons/zoom.png')
  end
  def admin_edit_btn
    return image_tag('icons/pencil.png')
  end
  def admin_delete_btn
    return image_tag('icons/cross.png')
  end
  def admin_add_btn
    return image_tag('icons/add.png', :class=>'labelimage')
  end
  def admin_images_btn
    return image_tag('icons/folder_image.png')
  end
end
