module CoursesHelper
  def random_color_normalized
    # randomly creates a color in HSV, then converts to RGB
    # algorithm from http://en.wikipedia.org/wiki/HSL_and_HSV#From_HSV
    h = rand(360)
    s = 0.38
    v = 0.9

    c = v * s
    h_prime = h / 60.0
    x = c*(1 - (h_prime % 2 - 1).abs)
    m = v - c

    if h == nil
      return [m,m,m]
    elsif h_prime < 1
      return [c+m, x+m, m]
    elsif h_prime < 2
      return [x+m, c+m, m]
    elsif h_prime < 3
      return [m, c+m, x+m]
    elsif h_prime < 4
      return [m, x+m, c+m]
    elsif h_prime < 5
      return [x+m, m, c+m]
    else
      return [c+m, m, x+m]
    end
  end

  def color_str(color)
    return "rgb(#{color[0]},#{color[1]},#{color[2]})"
  end

  def random_color
    color = random_color_normalized.collect! do |c|
      (c*255).floor()
    end
    return color
  end

  def darken_color(color)
    puts color
    return color.collect do |val|
      val-50
    end
  end
end
