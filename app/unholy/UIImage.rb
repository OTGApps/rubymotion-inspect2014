class UIImage
  def colorized(color)
    UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
    context = UIGraphicsGetCurrentContext()
    CGContextTranslateCTM(context, 0, self.size.height)
    CGContextScaleCTM(context, 1.0, -1.0)
    CGContextSetBlendMode(context, KCGBlendModeNormal)
    rect = CGRectMake(0, 0, self.size.width, self.size.height)
    CGContextClipToMask(context, rect, self.CGImage)
    color.setFill
    CGContextFillRect(context, rect)
    newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    newImage
  end
end
