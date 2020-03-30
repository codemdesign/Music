## https://soundcloud.com/code_m_design/en-quatre-temps-trois-mouvements
use_bpm 120

live_loop :mon_rock do
  amp = 3
  8.times do
    sample :bd_808, amp: amp
    sleep 0.5
  end
end


live_loop :melo do
  sync :mon_rock
  use_synth :fm
  ##| stop
  amp = 0.4
  a = 1.0
  ##| play_pattern_timed ([:c2, :d2, :c4, :d4]), [a], amp: amp
  play_pattern_timed ([:c4, :c4]), [a/2], amp: amp
  play_pattern_timed ([:d4, :c3, :d3]), [a], amp: amp
  ##| play_pattern_timed ([:d4]), [a], amp: amp
  ##| play_pattern_timed ([:d4, :d4]), [a/2], amp: amp
  ##| play_pattern_timed ([:c3, :c3 ] ), [a/2], amp: amp
  ##| play_pattern_timed ([:d3]), [a], amp: amp
  ##| play_pattern_timed ([:d3, :d3]), [a/2], amp: amp
end

live_loop :melo_2 do
  sync :mon_rock
  ##| stop
  with_fx :reverb, room: 1 do
    use_synth :piano
    amp = 0.4
    a = 1.0
    play_pattern_timed ([:c4, :d4, :c3, :d3]), [a], amp: amp
  end
end
