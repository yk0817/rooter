def time_rel(dtime)
  today = Time.now.to_i
  dtime = Time.parse(dtime).to_i
  # pp today

  if today > dtime.to_i
    return dtime.to_i + (60 * 60 * 24 * 365)
  else
    return dtime.to_i
  end

end
