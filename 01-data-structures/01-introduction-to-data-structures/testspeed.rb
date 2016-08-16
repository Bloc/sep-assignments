#!/usr/bin/env ruby

require 'benchmark'

TIMES = ARGV[0].to_i > 0 ? ARGV[0].to_i : 1000000

def testMinMax(n)
  values = Array.new(n){ rand(-45...300) }

  Benchmark.bmbm do |trial|
    trial.report('array minmax') do
      n.times do |idx|
        [0, [values[idx], 255].min].max
      end
    end

    trial.report('double ternary') do
      n.times do |idx|
        values[idx] < 0 ? 0 : (values[idx] > 255 ? 255 : values[idx])
      end
    end

    trial.report('double ternary w/ cache') do
      n.times do |idx|
        x = values[idx]
        x < 0 ? 0 : (x > 255 ? 255 : x)
      end
    end
  end

end

def testInclusion(n)
  values = Array.new(n){ [rand(-45...300), rand(-45...300)] }

  Benchmark.bmbm do |trial|
    trial.report('range includes') do
      n.times do |idx|
        ((0..255).include?(values[idx][0])) && ((0..255).include?(values[idx][1]))
      end
    end

    trial.report('double ternary') do
      n.times do |idx|
        [0, 1].map do |e|
          values[idx][e] < 0 ? 0 : (values[idx][e] > 255 ? 255 : values[idx][e])
        end
      end
    end

    trial.report('double ternary w/ cache') do
      n.times do |idx|
        x = values[idx]
        [0, 1].map do |e|
          y = x[e]
          y < 0 ? 0 : (y > 255 ? 255 : y)
        end
      end
    end

    trial.report('combined double ternary (ugly)') do
      n.times do |idx|
        pixel = values[idx]
        x = pixel[0]
        y = pixel[1]
        (x < 0 ? 0 : (x > 255 ? 255 : x)) && (y < 0 ? 0 : (y > 255 ? 255 : y))
      end
    end

  end

end

puts "="*40
puts "Test [0, [x, 255].min].max:"
puts
testMinMax TIMES

puts
puts "="*40
puts "Test ((0..width).include?(x)) && ((0..height).include?(y)):\n"
puts
testInclusion TIMES
