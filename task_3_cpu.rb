pid = Process.pid
finish_time = Time.now.to_i + (60 * 1)
cpu_metrix = []

# work thread
Thread.new do
  loop do
    # do some math
    100_500 ** 2
    sleep 1
    break if Time.now.to_i > finish_time
  end
end

monitoring_tread = Thread.new do
  loop do
    cpu_metrix << `ps -p #{pid} -o %cpu`.gsub(/ %CPU\n/, '').to_f
    sleep 1
    break if Time.now.to_i > finish_time
  end
end

monitoring_tread.join
average = cpu_metrix.sum(0.0) / cpu_metrix.count

puts "Average CPU load is: #{average} %"

# ruby task_3_cpu.rb
# Average CPU load is: 0.3377049180327869 %
