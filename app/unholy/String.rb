class String
  def titleize
    split(/(\W)/).map(&:capitalize).join
  end
end
