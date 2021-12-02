OscIn oin;
1979 => oin.port;
oin.addAddress("/hotMilk/piano/alto");
OscMsg msg;

float HN, QN, EN, SN, TN;
75 => int beat;
60.0 / beat => QN; // Second per Beat, 4, 0.8s
QN * 2 => HN; // 8, 1.6s
QN / 2 => EN; // 2, 0.4s
QN / 4 => SN; // 1, 0.2s
QN / 8 => TN; // 0.5, 0.1s
SN + TN => float SPT; // 1.5
SN - TN => float SMT; // 0.5

NRev global_reverb => dac;
0.1 => global_reverb.mix;
Rhodey r => global_reverb;
Rhodey r1 => global_reverb;
Rhodey r2 => global_reverb;
Rhodey r3 => global_reverb;
Rhodey r4 => global_reverb;
Rhodey r5 => global_reverb;
Rhodey r6 => global_reverb;

["A3","A2"] @=> string mnotes1[]; // M1
["D3","D2"] @=> string mnotes2[]; // M2
["G3","G2"] @=> string mnotes3[]; // M3
["E3","E2"] @=> string mnotes4[]; // M4

[
"-1", // -1.1-
"-1", "-1",
"M1","-1", "-1",
"M2","-1", "-1",
"M3","-1", "-1",
"M4","-1", "-1", // -1.2-
"M1","-1", "-1",
"M2","-1", "-1"
] @=> string anotes[];

[
"-1"
] @=> string notes[];

// 16 per block (8 per half block)
[
HN, // -1.1-
HN, HN,
QN,QN, HN,
QN,QN, HN,
QN,QN, HN,
QN,QN, HN, // -1.2-
QN,QN, HN,
QN,QN, HN
] @=> float adurs[];

[
HN
] @=> float durs[];

while (true) {
    oin => now;
    while (oin.recv(msg) != 0) {
        msg.getInt(0) => int play;
        if (play) {
            spork ~ piano(anotes, adurs);
        }
    }
}

fun int midi(string name) {
    if (name=="-1") return 0;
    [21,23,12,14,16,17,19] @=> int notes[]; // A0,B0,C0,D0,E0,F0,G0
    name.charAt(0) - 65 => int base; // A=0,B=1,C=2,D=3,E=4,F=5,G=6
    notes[base] => int note;
    if (0 <= base && base <= 6) {
        if (name.charAt(1) == '#' || name.charAt(1) == 's') // sharp
            notes[base] + 1 => note;
        if (name.charAt(1) == 'b' || name.charAt(1) == 'f') // flat
            notes[base] - 1 => note;
    }
    else {
        <<< "Illegal Note Name!" >>>;
        return 0;
    }
    name.charAt(name.length()-1) - 48 => int oct; // 0, 1, 2, ..., 9
    if (0 <= oct && oct <= 9) {
        12 * (oct-1) +=> note;
        return note;
    }
    else {
        <<< "Illegal Octave!" >>>;
        return 0;
    }
}

fun void playPiano(StkInstrument instrument, string note, float durs) {
    Std.mtof(midi(note)) => instrument.freq;
    0.1 => instrument.noteOn;
    (durs-TN/2.0)::second => now;
    1 => instrument.noteOff;
    (TN/2.0)::second => now;
}

fun void playPiano(StkInstrument instrument, string note, float durs, float delay) {
    Std.mtof(midi(note)) => instrument.freq;
    1 => instrument.noteOff;
    delay::second => now;
    0.1 => instrument.noteOn;
    (durs-delay-TN/2.0)::second => now;
    1 => instrument.noteOff;
    (TN/2.0)::second => now;
}

fun void piano(string notes[], float durs[]) {
    for(0 => int i; i < notes.size(); i++) {
        if(notes[i].charAt(0)-77 != 0) { // not M
            spork ~ playPiano(r, notes[i], durs[i]);
            durs[i]::second => now;
        }
        else{ // M
            if(notes[i].charAt(1)-48 == 1) { // M1
                spork ~ playPiano(r1, mnotes1[0], durs[i]);
                spork ~ playPiano(r2, mnotes1[1], durs[i]);
            }
            else if(notes[i].charAt(1)-48 == 2) { // M2
                spork ~ playPiano(r1, mnotes2[0], durs[i]);
                spork ~ playPiano(r2, mnotes2[1], durs[i]);
            }
            else if(notes[i].charAt(1)-48 == 3) { // M3
                spork ~ playPiano(r1, mnotes3[0], durs[i]);
                spork ~ playPiano(r2, mnotes3[1], durs[i]);
            }
            else if(notes[i].charAt(1)-48 == 4) { // M4
                spork ~ playPiano(r1, mnotes4[0], durs[i]);
                spork ~ playPiano(r2, mnotes4[1], durs[i]);
            }
            durs[i]::second => now;
        }
    }
}