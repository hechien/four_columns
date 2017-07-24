require 'rubygems'
require 'bundler/setup'

class FourColumns
  require 'active_support'
  require 'active_support/core_ext/string'
  require 'active_support/core_ext/date/calculations'
  require 'active_support/core_ext/date_time/calculations'

  def initialize
    @sixty_jia_zhi = nil
    @base_year    = 1984
    @base_day     = '2017-02-06'.to_date
    @target_date   = Date.current

    @columns = {
      year: nil,
      month: nil,
      day: nil,
      time: nil
    }
  end

  def convert_from_date(date)
    @target_date = date.to_date
    calculate_year_column
    # calculate_month_column
    calculate_day_column
    # caluclate_time_column
    
    return @columns
  end

  private

  def sixty_jia_zhi
    @sixty_jia_zhi ||= [
      '甲子','乙丑','丙寅','丁卯','戊辰','已巳','庚午','辛未','壬申','癸酉',
      '甲戌','乙亥','丙子','丁丑','戊寅','已卯','庚辰','辛巳','壬午','癸未',
      '甲申','乙酉','丙戌','丁亥','戊子','己丑','庚寅','辛卯','壬辰','癸巳',
      '甲午','乙未','丙申','丁酉','戊戌','已亥','庚子','辛丑','壬寅','癸卯',
      '甲辰','乙巳','丙午','丁未','戊申','已酉','庚戌','辛亥','壬子','癸丑',
      '甲寅','乙卯','丙辰','丁巳','戊午','已未','庚申','辛酉','壬戌','癸亥'
    ]
  end

  def calculate_year_column
    offset = (@target_date.year - @base_year).to_i % 60
    @columns[:year] = sixty_jia_zhi[offset]
  end

  def calculate_day_column
    offset = (@target_date - @base_day).to_i % 60
    @columns[:day] = sixty_jia_zhi[offset]
  end
end