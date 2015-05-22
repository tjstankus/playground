def round_up_quarter(f)
  result = (f * 4.0).round / 4.0
  result > f ? result : result + 0.25
end

puts round_up_quarter(2.2)
puts round_up_quarter(4.6)
