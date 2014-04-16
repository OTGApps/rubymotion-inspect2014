class UIView
  def totalHeight
    height = 0.0
    subviews.each do |v|
      if (height < v.frame.origin.y + v.frame.size.height)
        height = v.frame.origin.y + v.frame.size.height;
      end
    end
    height
  end
end
