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
    # "talks_cached".add_observer(self, :reload_talks)
  end

  def will_appear
    # We only want to create the views once.
    @view_is_set_up ||= begin
      layout(self.view.superview) do
        @header_view = subview(ScheduleHeaderView, :header_view, {days: @days})
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

      table_view.contentInset = UIEdgeInsetsMake(65, 0, 0, 0);
      true
    end
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
      title: "Talk",
      subtitle: item['title'],
      cell_identifier: "schedule_speaker_cell",
      cell_class: PM::TableViewCell,
    }
  end

  def break_cell(item)
    {
      cell_identifier: "schedule_break_cell",
      cell_class: ScheduleBreakCellView,
      time_label: item['time'],
      title_label: item['title'],
      break_icon: item['icon']
    }
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
    build_cells
  end

  def reload_talks
    load_data
    update_table_data
  end

  def viewDidUnload
    "talks_cached".remove_observer(self)
  end

  #
  # #{{{ Table view delegate
  # def tableView(table_view, heightForRowAtIndexPath: path)
  #   i = path.indexAtPosition(1)
  #   if @current_schedule[i]['type'] == 'break'
  #     32.0
  #   else
  #     80.0
  #   end
  # end
  #
  # def tableView(tableView, heightForFooterInSection:section)
  #    # This will create a "invisible" footer
  #    return 0.01
  # end
  #
  # def tableView(table_view, didSelectRowAtIndexPath: path)
  #   i = path.indexAtPosition(1)
  #   return if @current_schedule[i]['type'] == 'break'
  #   speakers = SpeakersViewController.new
  #   speakers.navigationItem.title = "Speakers"
  #   speakers.start_with = @current_schedule[i]['speaker_index'].to_i
  #   self.navigationController.pushViewController(
  #     speakers,
  #     animated: true
  #   )
  # end
  # #}}}
  #
  # def tableView(table_view, cellForRowAtIndexPath: path)
  #   item = @current_schedule[path.indexAtPosition(1)]
  #   if item['type'] == 'break'
  #     cell = table_view.dequeueReusableCellWithIdentifier("schedule_break_cell") || ScheduleBreakCellView.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier: "schedule_break_cell")
  #   else
  #     cell = table_view.dequeueReusableCellWithIdentifier("schedule_speaker_cell") || ScheduleSpeakerCellView.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier: "schedule_speaker_cell")
  #   end
  #   cell.fill(item)
  #   cell
  # end
  #
  # def tableView(table_view, numberOfRowsInSection: section)
  #   @current_schedule.size
  # end
  #
  # #def tableView(table_view, willDeselectRowAtIndexPath: path)
  # #end
  #
  # #def tableView(table_view, willSelectRowAtIndexPath: path)
  # #end
  #
  # def numberOfSectionsInTableView(table_view)
  #   1
  # end
  # #}}}

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
    #
    # ap

  end

end
