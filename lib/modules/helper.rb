module Helper
  def intervalTimer(seconds)
    loop do
      sleep seconds
      yield
    end
  end
end