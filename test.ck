SndBuf sample => dac;
me.dir() + "/audio/snare_01.wav" => string filename;
filename => sample.read;
0.5 => sample.gain;
0 => sample.pos;
second => now;