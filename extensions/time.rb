class Time
  def time_ago_in_minutes
    return (Time.now-self)/60
  end

  def time_ago_in_hours
    return (Time.now-self)/60/60
  end

  def time_ago_in_days
    return (Time.now-self)/24/60/60
  end
  
  def time_ago_in_weeks
    return (Time.now-self)/24/60/60/7
  end
  
  def time_ago_in_years
    return (Time.now-self)/24/60/60/365
  end
  
  def self.time_from_now_in_hash(time)
    distance = (time-Time.now).to_i
    days = distance/24/60/60
    distance -= 24*60*60*days
    hours = distance/60/60
    distance -= 60*60*hours
    minutes = distance/60
    distance -= 60*minutes
    seconds = distance
    return {:days => days, :hours => hours, :minutes => minutes, :seconds => seconds}
  end
  
  def self.time_from_now_in_words(time)
    time_hash = self.time_from_now_in_hash(time)
    time_term = ""
    [:days, :hours, :minutes, :seconds].each do |time_interval|
      time_term += time_hash[time_interval] == 1 ? "#{time_hash[time_interval]} #{time_interval.to_s.chop}, " : "#{time_hash[time_interval]} #{time_interval}, " if time_hash[time_interval] != 0
    end
    time_term.chop!.chop!
    return time_term
  end
end