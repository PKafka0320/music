OscIn oin;
1979 => oin.port;
oin.addAddress("/hotMilk");
OscMsg msg;

float HN, QN, EN, SN, TN;
75 => int beat;
60.0 / beat => QN; // Second per Beat, 4
QN * 2 => HN; // 8
QN / 2 => EN; // 2
QN / 4 => SN; // 1
QN / 8 => TN; // 0.5
SN + TN => float SPT; // 1.5
SN - TN => float SMT; // 0.5

NRev global_reverb => dac;
0.1 => global_reverb.mix;

["B50","G50","E50","C50"] @=> string mnotes1[];
["B50","F#50","D#50","C50"] @=> string mnotes2[];
["B50","A50","F#50","D50","B40"] @=> string mnotes3[];
["A50","G50","D50","B40"] @=> string mnotes4[];
["A50","F#50","D50","B40"] @=> string mnotes5[];

[
"G70","F#70","D70","B60", // -1-
"A60","-10", "G60","A60","G70","F#70","D70","A60",
"M1","-10", "-10","G50","A50","G60","F#60","D60","A50",
"M2","-10", "A50","G50","D60",
"M3","-10", "-10","-10",
"M4","-10", "-10","G60","A60","G70","F#70","D70","A60", // -2-
"M1","-10", "D60","G50","G60","D60","B60","D#60","G60","A60",
"M2","D70", "E70","D70","B60","A60",
"M5","-10", "-10","-10",
"M4","-10", "-10","-10",
"M1","-10", "D60","G50","G60","D60","B60","D#60","G60","A60", // -3-
"M2","D70", "E70","D70","B60","A60",
"M5","-10", "-10","-10",
"M4","-10", "-10","G60","A60","G70","F#70","D70","A60",
"M1","-10", "D60","G50","G60","D60","B60","D#60","G60","A60", // -4-
"M2","D70", "E70","D70","B60","A60",
"M5","-10", "-10","-10",
"M4","-10", "-10","G60","A60","G70","F#70","D70","A60",
"M1","-10", "-10","G50","A50","G60","F#60","D60","A50", // -5-
"M2","G60","A60","G70","F#70","D70","A60"
] @=> string anotes[];

[
"M1","-10", "D60","G50","G60","D60","B60","D#60","G60","A60"
] @=> string notes[];

// 16 per block (8 per half block)
[
EN,EN,EN,EN, // -1- 2,2,2,2 (half block)
HN, EN,SPT,SMT,SPT,SMT,SPT,SMT, // 8, 2,1.5,0.5,1.5,0.5,1.5,0.5
QN,QN, EN,SPT,SMT,SPT,SMT,SPT,SMT, // 4,4, 2,1.5,0.5,1.5,0.5,1.5,0.5
QN,QN, QN,EN,EN, // 4,4 4,2,2
QN,QN, QN,QN, // 4,4 4,4
QN,QN, EN,SPT,SMT,SPT,SMT,SPT,SMT, // -2- 4,4 2,1.5,0.5,1.5,0.5,1.5,0.5
QN,QN, SPT,SMT,SPT,SMT,SPT,SMT,SPT,SMT, // 4,4 1.5,0.5,1.5,0.5,1.5,0.5,1.5,0.5
QN,QN, EN,EN,EN,EN, // 4,4, 2,2,2,2
QN,QN, QN,QN, // 4,4, 4,4
QN,QN, QN,QN, // 4,4, 4,4
QN,QN, SPT,SMT,SPT,SMT,SPT,SMT,SPT,SMT, // -3- 4,4 1.5,0.5,1.5,0.5,1.5,0.5,1.5,0.5
QN,QN, EN,EN,EN,EN, // 4,4, 2,2,2,2
QN,QN, QN,QN, // 4,4, 4,4
QN,QN, EN,SPT,SMT,SPT,SMT,SPT,SMT, // 4,4 2,1.5,0.5,1.5,0.5,1.5,0.5
QN,QN, SPT,SMT,SPT,SMT,SPT,SMT,SPT,SMT, // -4- 4,4 1.5,0.5,1.5,0.5,1.5,0.5,1.5,0.5
QN,QN, EN,EN,EN,EN, // 4,4, 2,2,2,2
QN,QN, QN,QN, // 4,4, 4,4
QN,QN, EN,SPT,SMT,SPT,SMT,SPT,SMT, // 4,4 2,1.5,0.5,1.5,0.5,1.5,0.5
QN,QN, EN,SPT,SMT,SPT,SMT,SPT,SMT, // -5- 4,4 2,1.5,0.5,1.5,0.5,1.5,0.5
EN,SPT,SMT,SPT,SMT,SPT,SMT // 2,1.5,0.5,1.5,0.5,1.5,0.5
] @=> float adurs[];

[
QN,QN, SPT,SMT,SPT,SMT,SPT,SMT,SPT,SMT // 4,4 1.5,0.5,1.5,0.5,1.5,0.5,1.5,0.5
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
    if (name=="-10" || name=="-11") return 0;
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
    name.charAt(name.length()-2) - 48 => int oct; // 0, 1, 2, ..., 9
    if (0 <= oct && oct <= 9) {
        12 * (oct-1) +=> note;
        return note;
    }
    else {
        <<< "Illegal Octave!" >>>;
        return 0;
    }
}

fun void piano(string notes[], float durs[]) {
    for(0 => int i; i < notes.size(); i++) {
        if(notes[i].charAt(0)-77 != 0) { // not M
            spork ~ playPiano(new Rhodey, notes[i], durs[i]);
            durs[i]::second => now;
        }
        else {
            if(notes[i].charAt(1)-48 == 1) { // M1
                for(0 => int j; j < mnotes1.size(); j++) {
                    spork ~ playPiano(new Rhodey, mnotes1[j], durs[i]);
                }
            }
            else if(notes[i].charAt(1)-48 == 2) { // M1
                for(0 => int j; j < mnotes2.size(); j++) {
                    spork ~ playPiano(new Rhodey, mnotes2[j], durs[i]);
                }
            }
            else if(notes[i].charAt(1)-48 == 3) { // M1
                for(0 => int j; j < mnotes3.size(); j++) {
                    spork ~ playPiano(new Rhodey, mnotes3[j], durs[i]);
                }
            }
            else if(notes[i].charAt(1)-48 == 4) { // M1
                for(0 => int j; j < mnotes4.size(); j++) {
                    spork ~ playPiano(new Rhodey, mnotes4[j], durs[i]);
                }
            }
            else if(notes[i].charAt(1)-48 == 5) { // M1
                for(0 => int j; j < mnotes5.size(); j++) {
                    spork ~ playPiano(new Rhodey, mnotes5[j], durs[i]);
                }
            }
            durs[i]::second => now;
        }
    }
}

fun void playPiano(StkInstrument instrument, string note, float durs) {
    instrument => global_reverb;
    Std.mtof(midi(note)) => instrument.freq;
    0.2 => instrument.noteOn;
    durs::second => now;
    if(note.charAt(note.length()-1)-48) { // 1
        1 => instrument.noteOff;
        TN::second => now;
    }
}
