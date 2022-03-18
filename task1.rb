require 'time'

module Logger
  def call(args)
    puts "#{Time.now.utc.iso8601} #{self.class} start with: #{args.inspect}"
    result = super
    puts "#{Time.now.utc.iso8601} #{self.class} finished: #{result}"
  end
end

class SquaringService
  prepend Logger

  def call(args)
    args.map { _1 ** 2 }
  end
end

SquaringService.new.([1,2,3])
# => 2022-03-18T07:16:37Z SquaringService start with: [1, 2, 3]
# => 2022-03-18T07:16:37Z SquaringService finished: [1, 4, 9]
