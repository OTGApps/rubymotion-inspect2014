class ScheduleBreakCellView < PM::TableViewCell

  attr_reader :time_label, :title_label, :break_icon

  def initWithStyle(style_name, reuseIdentifier: reuseIdentifier)
    super.tap do
      selectionStyle = UITableViewCellSelectionStyleNone

      self.contentView.stylesheet = Teacup::Stylesheet[:break_cell]
      layout(self.contentView, :content_view) do
        subview(UIView, :line)
        @time_label = subview(UILabel, :time)
        @title_label = subview(UILabel, :title)
        @break_icon = subview(UIImageView, :icon)
      end
    end
  end

  def item=(i)
    @time_label.text = i['time']
    @title_label.text = i['title']
    @break_icon.image = i['icon'].uiimage
  end

  def layoutSubviews
    super
    self.contentView.layer.sublayers[0].frame = self.contentView.bounds
  end
end
