class TalksViewController < GenericTableScreen
  stylesheet :talks
  title "Talks"

  SCROLL_DIRECTION_DOWN = 0
  SCROLL_DIRECTION_UP = 1

  def on_init
    super
    @current_day = 0
    load_data
    "talks_cached".add_observer(self, :reload_talks)
  end

  def view_will_appear(animated)
    # We only want to create the views once.
    @view_is_set_up ||= begin
      layout(table_view.superview) do
        @header_view = subview(ScheduleHeaderView, :header_view, { days: @days }) do
          @blur = subview(UIToolbar, :blur)
        end
        @header_view.sendSubviewToBack(@blur)

        @header_view.buttons.each do |button|
          button.on(:touch) do
            @header_view.clear_selection
            button.selected = true
            @current_day = button.tag
            @current_schedule = @schedule[@days[@current_day]]
            update_table_data
            table_view.scrollToRowAtIndexPath([0, 0].nsindexpath, atScrollPosition: UITableViewScrollPositionTop, animated: true)
          end
        end
        @header_view.buttons.first.selected = true
      end

      table_view.contentInset = UIEdgeInsetsMake(69, 0, 0, 0);
      true
    end
  end

  def will_disappear
    @header_view.alpha = 0.0
  end

  def view_did_appear(animated)
    return unless @header_view

    @header_view.alpha = 0.0
    table_view.superview.bringSubviewToFront(@header_view)

    UIView.animateWithDuration(0.25,
      animations: lambda {
         @header_view.alpha = 1.0
      },
      completion:nil
    )
  end

  def table_data
    [{
      cells: build_cells
    }]
  end

  def build_cells
    return [] unless @current_schedule

    cells = []
    @current_schedule.each do |item|
      cell = (item['type'] == 'break') ? break_cell(item) : talk_cell(item)
      cells << cell
    end
    cells
  end

  def talk_cell(item)
    {
      cell_identifier: "schedule_speaker_cell",
      cell_class: ScheduleSpeakerCellView,
      height: 80.0,
      item: item,
      action: :tapped_talk
    }
  end

  def break_cell(item)
    {
      cell_identifier: "schedule_break_cell",
      cell_class: ScheduleBreakCellView,
      height: 32.0,
      item: item
    }
  end

  def tapped_talk(args)
    open SpeakerViewController.new({speaker: args[:cell][:item][:speaker_index]})
  end

  def load_data
    path = "talks.plist"
    if path.document_path.file_exists?
      @schedule = NSMutableDictionary.dictionaryWithContentsOfFile(path.document_path)
      unless @schedule
        @schedule = NSMutableDictionary.dictionaryWithContentsOfFile(path.resource_path)
      end
    else
      @schedule = NSMutableDictionary.dictionaryWithContentsOfFile(path.resource_path)
    end
    @days = @schedule.keys.reverse
    @current_schedule = @schedule[@days[@current_day]]
  end

  def reload_talks
    load_data
    update_table_data
  end

  def header_frame
    @header_frame ||= CGRectMake(0, 60, Device.screen.width, 73)
  end

  def header_min_y
    -header_frame.size.height
  end

  def scrollViewWillBeginDragging(scrollView)
    @lastContentOffset = scrollView.contentOffset.y
  end

  def scrollViewDidScroll(scrollView)
    return unless scrollView
    return unless @lastContentOffset

    currentOffset = scrollView.contentOffset.y
    scrollDirection = (@lastContentOffset > currentOffset) ? SCROLL_DIRECTION_UP : SCROLL_DIRECTION_DOWN

    differenceFromLast = @lastContentOffset - currentOffset
    @lastContentOffset = currentOffset

    if scrollDirection == SCROLL_DIRECTION_DOWN
      if @header_view.frame.origin.y > header_min_y && currentOffset > -133
        @header_view.frame = CGRectMake(@header_view.origin.x,
                                        @header_view.origin.y - differenceFromLast.abs,
                                        @header_view.size.width,
                                        @header_view.size.height)
      end
    elsif scrollDirection == SCROLL_DIRECTION_UP && scrollView.contentSize.height > (currentOffset + frame.size.height)
      # @header_view.layer.removeAllAnimations
      UIView.animateWithDuration(0.2, animations: lambda do
        @header_view.frame = header_frame
      end)
    end
  end
end
