module Colorable
  def green(text)
    "\e[32m#{text}\e[0m"
  end

  def red(text)
    "\e[31m#{text}\e[0m"
  end

  def magenta(text)
    "\e[35m#{text}\e[0m"
  end
  
  def cyan(text)
    "\e[36m#{text}\e[0m"
  end

  def bg_red(text)
    "\e[41m#{text}\e[0m"
  end

  def no_colors(text)
    text.gsub /\e\[\d+m/, ""
  end

  end