# Colorgy 資料集：課程節次資料

[![Gem Version](https://badge.fury.io/rb/colorgy-course-period.svg)](https://badge.fury.io/rb/colorgy-course-period)

本專案整理了全臺各大專院校的課程資料，資料格式為 csv 檔，放在 [`lib/colorgy/course_period/data`](lib/colorgy/course_period/data) 底下，資料格式以 NTUST 為例：

> `lib/colorgy/course_period/data/ntust.csv`

```csv
1,0,07:10-08:00
2,1,08:10-09:00
3,2,09:10-10:00
4,3,10:20-11:10
5,4,11:20-12:10
6,5,12:20-13:10
7,6,13:20-14:10
8,7,14:20-15:10
9,8,15:30-16:20
10,9,16:30-17:20
11,10,17:30-18:20
12,A,18:25-19:15
13,B,19:20-20:10
14,C,20:10-21:05
15,D,21:10-22:00
```

檔名為學校名稱小寫，第一欄為順序(`order`)，第二欄為節次代碼(`code`)，第三欄為時段字串。

`order` 從 1 開始排列，代碼無特別限制；時段字串為二十四小時制、以減號 `-` 分隔。

## 安裝

把這行加入 Gemfile：

```ruby
# or latest from github, prefer
gem 'colorgy-course-period', require: 'colorgy/course_period', github: 'colorgy/course-period', branch: 'master'

# from rubygems.org
gem 'colorgy-course-period', require: 'colorgy/course_period'
```


然後執行：

```bash
$ bundle
```

或是直接安裝：

```bash
$ gem install colorgy-course-period
```

## 設定

在 Rails 裡, 在建立 `config/initializer/colorgy_course_period.rb` 並貼入以下內容：

```ruby
Colorgy.time_class = Time.zone
```

## 使用方法

```ruby
require 'colorgy/course_period' # bundler would auto require

period = Colorgy::CoursePeriod.find('ntust')

period.code_map
# => {"0"=>1, "1"=>2, "2"=>3, "3"=>4, "4"=>5, "5"=>6, "6"=>7, "7"=>8, "8"=>9, "9"=>10, "10"=>11, "A"=>12, "B"=>13, "C"=>14, "D"=>15}
period.order_map
# => {1=>"0", 2=>"1", 3=>"2", 4=>"3", 5=>"4", 6=>"5", 7=>"6", 8=>"7", 9=>"8", 10=>"9", 11=>"10", 12=>"A", 13=>"B", 14=>"C", 15=>"D"}

period.count
# => 15
period.first.start_time(Date.today)
# => "20160810T071000Z"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Colorgy/colorgy-course-period. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

