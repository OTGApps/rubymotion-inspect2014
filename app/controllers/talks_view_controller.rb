class TalksViewController < GenericTableScreen
  stylesheet :talks
  title "Talks"

  SCROLL_DIRECTION_DOWN = 0
  SCROLL_DIRECTION_UP = 1

  def on_init
    super
    @schedule_name = :talks
    @current_day = 0
    load_data
    "talks_cached".add_observer(self, :reload_talks)
  end

  def view_will_appear(animated)
    # We only want to create the views once.
    @view_is_set_up ||= begin
      layout(table_view.superview) do
        @header_view = subview(ScheduleHeaderView, :header_view, { days: @days })
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

      table_view.contentInset = UIEdgeInsetsMake(60, 0, 0, 0);
      true
    end
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
    spk = SpeakersViewController.new
    spk.navigationItem.title = "Speakers"
    spk.start_with = args[:cell][:item][:speaker_index]

    open spk
  end

  def load_data
    path = "#{@schedule_name}.plist"
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

  def scrollViewWillBeginDragging(scrollView)
    @startContentOffset = @lastContentOffset = scrollView.contentOffset.y;
  end

  def scrollViewDidScroll(scrollView)
    return unless scrollView
    return unless @lastContentOffset

    wasAnimated = false
    scrollDirection = (@lastContentOffset > scrollView.contentOffset.y) ? SCROLL_DIRECTION_UP : SCROLL_DIRECTION_DOWN

    if scrollDirection == SCROLL_DIRECTION_DOWN
      ap 'scrolling down'
    elsif scrollDirection == SCROLL_DIRECTION_UP
      ap 'scrolling up'
    end

    # currentOffset = scrollView.contentOffset.y
    # differenceFromLast = @lastContentOffset - currentOffset
    # @lastContentOffset = currentOffset

  end
end
