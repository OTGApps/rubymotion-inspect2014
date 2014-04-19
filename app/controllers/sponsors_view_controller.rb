class SponsorsViewController < GenericTableScreen
  stylesheet :sponsors
  title 'Our Sponsors'

  def table_data
    [{
      title: "Thanks to our generous sponsors:",
      cells: build_cells
    }]
  end

  def build_cells
    cells = []
    sponsors.each_with_index do |sponsor, index|
      cells << {
        cell_class: SponsorCell,
        sponsor_image: sponsor['image'],
        height: (index == 0) ? 144 : 72,
        action: :open_sponsor_url,
        arguments: { url: sponsor['www'] },
        accessory_type: UITableViewCellAccessoryDisclosureIndicator
      }
    end
    cells
  end

  def open_sponsor_url(args)
    args[:url].nsurl.open
  end

  def sponsors
    @sponsors_var ||= NSMutableArray.arrayWithContentsOfFile("sponsors.plist".resource_path)
  end

end
