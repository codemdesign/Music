# https://soundcloud.com/code_m_design/la-vague-with-pan

define :play_note do |n, t=0.25|
  play n
  sleep t
end
with_fx :reverb, mix: 0.5 do
  live_loop :oceans do
    stop
    s = synth [:bnoise, :cnoise, :gnoise].choose, amp: rrand(0.5, 1.5), attack: rrand(0, 4), sustain: rrand(0, 2), release: rrand(1, 5), cutoff_slide: rrand(0, 5), cutoff: rrand(60, 100), pan: rrand(-1, 1), pan_slide: rrand(1, 5), amp: rrand(0.5, 1)
    control s, pan: rrand(-1, 1), cutoff: rrand(60, 110)
    sleep rrand(2, 4)
  end
  
  live_loop :b do
    use_synth :tri
    stop
    amp = 0.25
    play_pattern_timed [45, 50, 55], [0.25, 0.5, 0.75], amp: amp
  end
  
  live_loop :c do
    use_synth :tri
    ##| sync :b
    stop
    sleep 0.25
    amp = 0.25
    pan = rrand(-1, 1)
    play_pattern_timed [77, 76, 75], [0.25, 0.5, 0.75], amp: amp, pan: pan
    2.times do
      play_pattern_timed [75, 74, 74, 75], [0.75, 0.25, 0.25, 0.75], amp: amp, pan: pan
    end
    play_pattern_timed [74, 74], [0.25, 0.25], amp: amp, pan: pan
  end
  
  live_loop :e do
    use_synth :tri
    sleep 0.75
    stop
    amp = 0.5
    pan = rrand(-1, 1)
    play_pattern_timed [77, 76, 75], [0.25, 0.5, 0.75], amp: amp, pan: pan
    2.times do
      play_pattern_timed [75, 74, 74, 75], [0.75, 0.25, 0.25, 0.75], amp: amp, pan: pan
    end
    ##| play_pattern_timed [74, 74], [0.25, 0.25], amp: amp, pan: pan
  end
  
  live_loop :d do
    use_synth :prophet
    stop
    sync :c
    amp = 0.5
    play_pattern_timed [45, 67, 76], [0.25], amp: amp
    play_pattern_timed [42, 64, 73], [0.25], amp: amp
    play_pattern_timed [48, 70, 79], [0.25], amp: amp
    play_pattern_timed [42, 64, 73], [0.25], amp: amp
    sleep 1
  end
end
