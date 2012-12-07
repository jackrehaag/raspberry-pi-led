class Led
  $io = WiringPi::GPIO.new
  RED_PIN = 6 # GPIO pin 25
  GREEN_PIN = 5 # GPIO pin 24
  $io.mode PIN, OUTPUT

  def red
    $io.write(GREEN_PIN, 0)
    $io.write(RED_PIN, 1)
    puts "Light is red"
  end

  def green
    $io.write(RED_PIN, 0)
    $io.write(GREEN_PIN, 1)
    puts "Light is green"
  end

  def yellow
    $io.write(RED_PIN, 1)
    $io.write(GREEN_PIN, 1)
    puts "Light is yellow"
  end

  def off
    $io.write(RED_PIN, 0)
    $io.write(GREEN_PIN, 0)
    puts "Light is off"
  end

  def colour(value)
    case value
    when "yellow"
      $io.write(RED_PIN, 1)
      $io.write(GREEN_PIN, 1)
    when "red"
      $io.write(RED_PIN, 1)
      $io.write(GREEN_PIN, 0)
    when "green"
      $io.write(RED_PIN, 0)
      $io.write(GREEN_PIN, 1)
    end
  end

  def blink(colour = "red", interval = 1)
    puts "light is blinking"
    color_code = colour(colour)
    loop do
      colour_code
      sleep(interval)
      off
    end
  end

  def cycle
    loop do
      # Red part
      $io.write(RED_PIN, 1)
      $io.write(GREEN_PIN, 0)
      sleep 0.5
      # Green part
      $io.write(RED_PIN, 0)
      $io.write(GREEN_PIN, 1)
      sleep 0.5
      # Yellow part
      $io.write(RED_PIN, 1)
      $io.write(GREEN_PIN, 1)
      sleep 0.5
    end
  end
end