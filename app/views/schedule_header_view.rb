class ScheduleHeaderView < UIView
  attr_reader :buttons

  def initWithFrame(frame)
    super.tap do
      self.opaque = false
      self.backgroundColor = UIColor.clearColor
    end
  end

  def clear_selection
    @buttons.each { |button| button.selected = false }
  end

  def days=(days)
    @days = days
    if @buttons
      @buttons.each do |b|
        b.removeFromSuperview
      end
    end

    @buttons = []

    right_image = 'button-menu-ticket'.uiimage
    right_image_disabled = 'button-menu-ticket-disabled'.uiimage

    left_image = UIImage.imageWithCGImage(right_image.CGImage, scale:right_image.scale, orientation:UIImageOrientationUpMirrored)
    left_image_disabled = UIImage.imageWithCGImage(right_image_disabled.CGImage, scale:right_image_disabled.scale, orientation:UIImageOrientationUpMirrored)

    w = right_image.size.width
    h = right_image.size.height

    @buttons << button(1, @days.first, CGRectMake(0, 20, w, h), [right_image, right_image_disabled], -30)
    @buttons << button(2, @days.last, CGRectMake(Device.screen.width - w, 20, w, h), [left_image, left_image_disabled], 30)
  end

  def button(i, day, frame, images, inset)
    title = "DAY #{i} • #{day[1..-1]}TH"
    button =  subview(UIButton.custom, {
      frame: frame,
      tag: i-1
    })
    button.titleLabel.font = 'JosefinSans-Bold'.uifont(11)
    button.setTitleColor(UIColor.blackColor, forState: :normal.uicontrolstate)
    button.setTitleColor(UIColor.whiteColor, forState: :selected.uicontrolstate)
    button.setTitle(title, forState: :selected.uicontrolstate)
    button.setTitle(title, forState: :normal.uicontrolstate)
    button.setBackgroundImage(images[0], forState: :selected.uicontrolstate)
    button.setBackgroundImage(images[1], forState: :normal.uicontrolstate)
    button.setBackgroundImage(images[1], forState: :highlighted.uicontrolstate)
    button.titleEdgeInsets = UIEdgeInsetsMake(0, inset, 0, 0)
    button
  end
end
