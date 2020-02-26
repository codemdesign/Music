# https://soundcloud.com/code_m_design/melody-sur-un-autre-theme

define :melody do |gamme, amp = 1|
  j = 0
  [1, 3, 6, 4].each do |d|
    (range -3, 3).each do |i|
      j = j+1
      play_chord (chord_degree d, :c, :major, gamme, invert: i),  amp: amp
      if j < 24
        sleep 0.25
      end
    end
  end
end

define :descente do |gamme, amp = 1|
  [6, 5, 4, 3, 2].each do |d|
    i = -3
    j = j+1
    play_chord (chord_degree d, :c, :major, gamme, invert: i),  amp: amp
    sleep 0.25
  end
end

define :both_melodies_2 do |gamme, amp = 1|
  2.times do
    melody gamme, amp
  end
  descente gamme-1, amp
  melody gamme-1, amp
  descente gamme-1, amp
end

live_loop :my_tick do
  sleep 0.25
end
live_loop :chord_inversion do
  sync :my_tick
  use_bpm 60
  ##| stop
  with_fx :echo, mix: 0.5, phase: 0.25, decay: 2 do
    use_synth :beep
    ##| use_synth :piano
    use_synth :dpulse
    gamme = 2
    amp = 0.005
    ##| both_melodies_2 gamme, amp
    melody gamme, amp
  end
end

live_loop :mm do
  sync :my_tick
  use_bpm 60
  stop
  ##| with_fx :echo, mix: 1, phase: 0.5, decay: 2 do
  use_synth :beep
  ##| use_synth :piano
  ##| use_synth :dpulse
  gamme = 3
  amp = 0.05
  ##| both_melodies_2 gamme, amp
  melody gamme, amp
  ##| end
end

##| sleep 7
live_loop :chord_inversion_2 do
  sync :my_tick
  stop
  use_synth :pretty_bell
  melody 2, 1
end

live_loop :chord_inversion_p do
  sync :my_tick
  stop
  use_synth :blade
  melody 2, 1
end

live_loop :d2 do
  sync :my_tick
  use_synth :pretty_bell
  ##| stop
  sleep 0.5
  gamme = 2
  amp = 0.1
  ##| possibilites = [[6, 5, 4, 3], [2, 2], [5, 4, 3]];
  possibilites = [[1, 1], [5, 4, 3, 2, 1], [4,3,2]]
  ##| choose(possibilites).each do |d|
  possibilites.each do |a|
    a.each do |d|
      i = -3
      play_chord (chord_degree d, :c, :major, gamme, invert: i),  amp: rrand(amp, amp+1)
      sleep 0.25
    end
    sleep 0.5
  end
end


##| sleep 10
live_loop :chord_inversion_3 do
  stop
  sync :my_tick
  ##| with_fx :echo do
  ##| use_synth :piano
  melody 5, 0.25
  ##| end
end
