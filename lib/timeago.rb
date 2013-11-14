# adapted from https://github.com/lmcalpin/tweet-tools/blob/master/timeago.rb

require 'time'

def timeago(time, options = {})
  start_date = options.delete(:start_date) || Time.new
  post_date = Time.parse(time.to_s)
  date_format = options.delete(:date_format) || :default
  delta_minutes = (start_date.to_i - post_date.to_i).floor / 60
  if delta_minutes.abs <= (8724*60)
    distance = distance_of_time_in_words(delta_minutes)
    if delta_minutes < 0
      return "#{distance} from now"
    else
      return "#{distance} ago"
    end
  else
    return "on #{post_date.strftime("%B %d, %Y")} at #{post_date.strftime("%I:%M:%S %p")}"
  end
end

def distance_of_time_in_words(minutes)
  case
  when minutes < 1
    "less than a minute"
  when minutes < 2
    "less than 2 minutes"
  when minutes < 3
    "less than 3 minutes"
  when minutes < 4
    "less than 4 minutes"
  when minutes < 5
    "less than 5 minutes"
  when minutes < 10
    "less than 10 minutes"
  when minutes < 15
    "less than 15 minutes"
  when minutes < 20
    "less than 20 minutes"
  when minutes < 30 
    "less than 30 minutes"
  when minutes < 40
    "less than 40 minutes"
  when minutes < 50
    "less than 50 minutes"
  when minutes < 80
    "about 1 hour"
  when minutes < 130
    "about 2 hours"
  when minutes < 1400
    #pluralize(minutes, "hour", "hours")
    "about #{(minutes / 60).round} hours"
  when minutes < 1440
    "one day"
  when minutes < 2880
    "about two days"
  when minutes < 10080
    "about #{(minutes / 1440).round} days"
  else
    "about #{(minutes / 10080).round} weeks"
  end
end

def pluralize(amount, singular, plural)
  amount == 1 ? singular : plural
end





# require 'date'

# module TimeAgo
#   def relative_time
#     raise "This isn't a Time like class. I can't calculate the relative time" unless respond_to? :to_time
#     rightnow = Time.new
#     backthen = to_time

#     delta_setting = (rightnow.to_i - backthen.to_i).floor
  
#     distance = distance_of_time_in_words(delta_setting)
#   end

# private

#   def distance_of_time_in_words(seconds)
#     case
#     when seconds < 25.seconds
#       "a few seconds ago"
#     when seconds < 31.seconds
#       "half a minute ago"
#     when seconds < 1.minute
#       "less than a minute ago"
#     when seconds < 2.minutes
#       "one minute ago"
#     when seconds < 45.minutes
#       "#{seconds/1.minute} minutes ago"
#     when seconds < 59.minutes
#       "less than one hour ago"
#     when seconds < 120.minutes
#       "one hour ago"
#     when seconds < 18.hours
#       "#{(seconds / 1.hour).round} hours ago"
#     when seconds < 48.hours
#       "yesterday"
#     when seconds < 6.days
#       "#{(seconds / 1.day).round} days ago"
#     when seconds < 1.week
#       "one week ago"
#     when seconds < 28.days
#       "#{(seconds / 1.week).round} weeks ago"
#     when seconds < 30.days
#       "one month ago"
#     when seconds < 364.days
#       "#{(seconds / 1.month).round} months ago"
#     when seconds <= 365.days
#       "one year ago"
#     when seconds < 5.years
#       "#{(seconds / 1.year).round} years ago"
#     else
#       "#{seconds / 1.minute} minutes ago"
#     end
#   end

# end

# class Time
#   include TimeAgo
# end

# if Object.const_defined? :ActiveSupport
#   module ActiveSupport
#     class TimeWithZone
#       include TimeAgo
#     end
#   end
# end
