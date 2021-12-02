OscIn oin;
1979 => oin.port;
oin.addAddress("/hotMilk/piano/soprano");
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

["B5","G5","E5","C5"] @=> string mnotes1[]; // M1
["B5","F#5","D#5","C5"] @=> string mnotes2[]; // M2
["B5","A5","F#5","D5","B4"] @=> string mnotes3[]; // M3
["A5","G5","D5","B4"] @=> string mnotes4[]; // M4
["A5","F#5","D5","B4"] @=> string mnotes5[]; // M5
["B6","F#6","D#6","C6"] @=> string mnotes6[]; // M6
["G7","D7","B6","G6","E6","E5"] @=> string mnotes7[]; // M7
["A5","F#5","D#5","C5"] @=> string mnotes8[]; // M8
["B5","F#5","C5"] @=> string mnotes9[]; // M9
["G5","E5","C5"] @=> string mnotes10[]; // M:
["A5","E5","C5"] @=> string mnotes11[]; // M;
["A5","D#5","C5"] @=> string mnotes12[]; // M<
["D6","F#5","D#5"] @=> string mnotes13[]; // M=
["B5","F#5","D5","B4"] @=> string mnotes14[]; // M>
["F#6","B5","F#5"] @=> string mnotes15[]; // M?
["G6","A5","G5"] @=> string mnotes16[]; // M@
["D6","A5","G5"] @=> string mnotes17[]; // MA
["B5","E5","C5"] @=> string mnotes18[]; // MB
["C5","G4"] @=> string mnotes19[]; // MC
["A4","F#4"] @=> string mnotes20[]; // MD
["G5","D5"] @=> string mnotes21[]; // ME
["B4","G4"] @=> string mnotes22[]; // MF
["G6","A5"] @=> string mnotes23[]; // MG

[
"G7","F#7","D7","B6", // -1.1-
"A6", "-1","G6","A6","G7","F#7","D7","A6",
"M1","-1", "-1","G5","A5","G6","F#6","D6","A5",
"M2","-1", "A5","G5","D6",
"M3","-1", "-1",
"M4","-1", "-1","G6","A6","G7","F#7","D7","A6", // -1.2-
"M1","-1", "D6","G5","G6","D6","B6","D#6","G6","A6",
"M2","D7", "E7","D7","B6","A6",
"M5","-1", "-1",
"M4","-1", "-1",
"M1","-1", "D6","G5","G6","D6","B6","D#6","G6","A6", // -1.3-
"M2","D7", "E7","D7","B6","A6",
"M5","-1", "-1",
"M4","-1", "-1","G6","A6","G7","F#7","D7","A6",
"M1","-1", "D6","G5","G6","D6","B6","D#6","G6","A6", // -1.4-
"M2","D7", "E7","D7","B6","A6",
"M5","-1", "-1",
"M4","-1", "-1","G6","A6","G7","F#7","D7","A6",
"M1","-1", "-1","G5","A5","G6","F#6","D6","A5", // -1.5-
"M2","G6","A6","G7","F#7","D7","A6", "A5","G5","D6",
"M3","G6","D7", "B6","-1",
"M4","-1", "-1","-1","D7","D7","D7", // -2.1-
"M1","-1", "-1","G5","A5","G6","F#6","D6","A5",
"M2","G7","F#7","D7","A6", "A5","G5","D6",
"M3","-1", "-1", // -2.2-
"M4","-1", "-1","N4",
"M1","M1","-1","M1","M1","M1","-1","M1", "-1","M1","-1","M1","-1","M1",
"M2","M2","-1","M2","-1","M2","M6","M2", "-1","M2","M2","M2", // -2.3-
"M5","M5","-1","M5","-1","M5","-1", "M5","M5","-1","M5","-1","M51","-1",
"M4","-1","M4","-1","M4", "N7","G5","A5","G6","F#6","D6","A5", // -2.4-
"M2","G6","A6","G7","F#7","D7","A6", "-1",
"M8","-1","F#5","D6", "M9","-1",
"M5","-1", "-1", // -2.5-
"M4","-1", "-1","N4",
"M1","-1", "-1","G6","A6","G7","F#7","D7","A6",
"M2","-1", "A5","G5","D6",
"M3","-1", "-1", // -3.1-
"M4","-1", "-1","G6","A6","G7","F#7","D7","A6",
"M1","-1", "D6","G5","G6","D6","B6","D#6","G6","A6",
"M2","D7", "E7","D7","B6","A6", // -3.2-
"M3","-1", "-1",
"M4","-1", "-1",
"M1","-1", "D6","G5","G6","D6","B6","D#6","G6","A6",
"M2","D7", "E7","D7","B6","A6", // -3.3-
"M5","-1", "-1",
"M4","-1", "-1","G6","A6","G7","F#7","D7","A6",
"M1","-1", "D6","G5","G6","D6","B6","D#6","G6","A6",
"M2","D7", "E7","D7","B6","A6", // -3.4-
"M5","-1", "-1",
"M4","-1", "-1","G6","A6","G7","F#7","D7","A6",
"M1","M1", "M:","M;",
"M2","D5", "M<","M=", // -3.5-
"M>","M5", "M?","M>",
"M4","M4", "G6","F#6","D6","B5",
"M1","M1", "M1","M1",
"M2","M2", "M2","G6","A6","G7","F#7","D7","A6", // -4.1-
"M5","M5", "M5","M5",
"M4","M4", "M@","F#6","MA","B5",
"MB","A5","M:","A5","-1","D5", "MC","-1","MC","B5","A5","G5",
"A5","D6","G5","-1","F#5","-1","D5", "MD","-1","ME","A5","-1","D5", // -4.2-
"MF","-1","M5", "M5","M5",
"MG","F#6","-1","D6","-1","D5","A5","D5", "G6","F#6","D6","A5",
"M1","M1", "M1","M1",
"M2","M2", "M2","G6","A6","G7","F#7","D7","A6", // -4.3-
"M5","M5", "M5","M5",
"M4","M4", "M@","F#6","MA","B5",
"M1","-1", "-1",
"M2","-1", "-1","G6","A6","G7","F#7","D7","A6", // -4.4-
"M5","-1", "G6","F#6","D6","B5",
"M4","G5","D6", "B5","-1","D5","G5","A5",
"M1","-1", "-1",
"-1", "G6","F#6","D6","B5",
"M5","-1", "-1","G6","A6","G7","F#7","D7","A6"// -4.5-
] @=> string anotes[];

[
"M2"
] @=> string notes[];

// 16 per block (8 per half block)
[
EN,EN,EN,EN,
HN, EN,SPT,SMT,SPT,SMT,SPT,SMT,
QN,QN, EN,SPT,SMT,SPT,SMT,SPT,SMT,
QN,QN, QN,EN,EN,
QN,QN, HN,
QN,QN, EN,SPT,SMT,SPT,SMT,SPT,SMT, // -1.2-
QN,QN, SPT,SMT,SPT,SMT,SPT,SMT,SPT,SMT,
QN,QN, EN,EN,EN,EN,
QN,QN, HN,
QN,QN, HN,
QN,QN, SPT,SMT,SPT,SMT,SPT,SMT,SPT,SMT, // -1.3-
QN,QN, EN,EN,EN,EN,
QN,QN, HN,
QN,QN, EN,SPT,SMT,SPT,SMT,SPT,SMT,
QN,QN, SPT,SMT,SPT,SMT,SPT,SMT,SPT,SMT, // -1.4-
QN,QN, EN,EN,EN,EN,
QN,QN, HN,
QN,QN, EN,SPT,SMT,SPT,SMT,SPT,SMT,
QN,QN, EN,SPT,SMT,SPT,SMT,SPT,SMT, // -1.5-
EN,SPT,SMT,SPT,SMT,SPT,SMT, QN,EN,EN,
QN,EN,EN, QN,QN, // 4,2,2, 4,4
QN,QN, QN,SPT,SMT,SPT,SMT, // -2.1-
QN,QN, EN,SPT,SMT,SPT,SMT,SPT,SMT,
QN,SPT,SMT,SPT,SMT, QN,EN,EN,
QN,QN, HN, // -2.2-
QN,QN, QN,QN,
SN,SN,SN,SN,SN,SN,SN,SN, SN,EN,SN,EN,SN,SN,
SN,SN,SN,SN,SN,SN,SN,SN, EN,EN,EN,EN, // -2.3-
SN,SN,SN,SN,SN,EN,SN, SN,SN,SN,SN,SN,EN,SN,
EN,SN,EN,SN,EN, EN,SPT,SMT,SPT,SMT,SPT,SMT, // -2.4-
EN,SPT,SMT,SPT,SMT,SPT,SMT, HN,
EN,EN,EN,EN, QN,QN,
QN,QN, HN, // -2.5-
QN,QN, QN,QN,
QN,QN, EN,SPT,SMT,SPT,SMT,SPT,SMT,
QN,QN, QN,EN,EN,
QN,QN, HN, // -3.1-
QN,QN, EN,SPT,SMT,SPT,SMT,SPT,SMT,
QN,QN, SPT,SMT,SPT,SMT,SPT,SMT,SPT,SMT,
QN,QN, EN,EN,EN,EN, // -3.2-
QN,QN, HN,
QN,QN, HN,
QN,QN, SPT,SMT,SPT,SMT,SPT,SMT,SPT,SMT,
QN,QN, EN,EN,EN,EN, // -3.3-
QN,QN, HN,
QN,QN, EN,SPT,SMT,SPT,SMT,SPT,SMT,
QN,QN, SPT,SMT,SPT,SMT,SPT,SMT,SPT,SMT,
QN,QN, EN,EN,EN,EN, // -3.4-
QN,QN, HN,
QN,QN, EN,SPT,SMT,SPT,SMT,SPT,SMT,
QN,QN, QN,QN,
QN,QN, QN,QN, // -3.5-
QN,QN, QN,QN,
QN,QN, EN,EN,EN,EN,
QN,QN, QN,QN,
QN,QN, EN,SPT,SMT,SPT,SMT,SPT,SMT, // -4.1-
QN,QN, QN,QN,
QN,QN, EN,EN,EN,EN,
EN,EN,SPT,SMT,SPT,SMT, EN,EN,SPT,SMT,SPT,SMT,
EN,SPT,SMT,SPT,SMT,SPT,SMT, EN,EN,SPT,SMT,SPT,SMT, // -4.2-
EN,EN,QN, QN,QN,
SPT,SMT,SPT,SMT,SPT,SMT,SPT,SMT, EN,EN,EN,EN,
QN,QN, QN,QN,
QN,QN, EN,SPT,SMT,SPT,SMT,SPT,SMT, // -4.3-
QN,QN, QN,QN,
QN,QN, EN,EN,EN,EN,
QN,QN, HN,
QN,QN, EN,SPT,SMT,SPT,SMT,SPT,SMT, // -4.4-
QN,QN, EN,EN,EN,EN,
QN,EN,EN, QN,SPT,SMT,SPT,SMT,
QN,QN, HN,
HN, EN,EN,EN,EN,
QN,QN, EN,SPT,SMT,SPT,SMT,SPT,SMT // -4.5-
] @=> float adurs[];

[
QN
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
        if(notes[i].charAt(0)-77 != 0 && notes[i].charAt(0)-77 != 1) { // not M,N
            0.1 => global_reverb.mix;
            spork ~ playPiano(r, notes[i], durs[i]);
            durs[i]::second => now;
        }
        else if (notes[i].charAt(0)-77 == 0) { // M
            if(notes[i].charAt(1)-48 == 1) { // M1
                spork ~ playPiano(r1, mnotes1[0], durs[i]);
                spork ~ playPiano(r2, mnotes1[1], durs[i]);
                spork ~ playPiano(r3, mnotes1[2], durs[i]);
                spork ~ playPiano(r4, mnotes1[3], durs[i]);
            }
            else if(notes[i].charAt(1)-48 == 2) { // M2
                spork ~ playPiano(r1, mnotes2[0], durs[i]);
                spork ~ playPiano(r2, mnotes2[1], durs[i]);
                spork ~ playPiano(r3, mnotes2[2], durs[i]);
                spork ~ playPiano(r4, mnotes2[3], durs[i]);
            }
            else if(notes[i].charAt(1)-48 == 3) { // M3
                spork ~ playPiano(r1, mnotes3[0], durs[i]);
                spork ~ playPiano(r2, mnotes3[1], durs[i]);
                spork ~ playPiano(r3, mnotes3[2], durs[i]);
                spork ~ playPiano(r4, mnotes3[3], durs[i]);
                spork ~ playPiano(r5, mnotes3[4], durs[i]);
            }
            else if(notes[i].charAt(1)-48 == 4) { // M4
                spork ~ playPiano(r1, mnotes4[0], durs[i]);
                spork ~ playPiano(r2, mnotes4[1], durs[i]);
                spork ~ playPiano(r3, mnotes4[2], durs[i]);
                spork ~ playPiano(r4, mnotes4[3], durs[i]);
            }
            else if(notes[i].charAt(1)-48 == 5) { // M5
                spork ~ playPiano(r1, mnotes5[0], durs[i]);
                spork ~ playPiano(r2, mnotes5[1], durs[i]);
                spork ~ playPiano(r3, mnotes5[2], durs[i]);
                spork ~ playPiano(r4, mnotes5[3], durs[i]);
            }
            else if(notes[i].charAt(1)-48 == 6) { // M6
                spork ~ playPiano(r1, mnotes6[0], durs[i]);
                spork ~ playPiano(r2, mnotes6[1], durs[i]);
                spork ~ playPiano(r3, mnotes6[2], durs[i]);
                spork ~ playPiano(r4, mnotes6[3], durs[i]);
            }
            else if(notes[i].charAt(1)-48 == 8) { // M8
                spork ~ playPiano(r1, mnotes8[0], durs[i]);
                spork ~ playPiano(r2, mnotes8[1], durs[i]);
                spork ~ playPiano(r3, mnotes8[2], durs[i]);
                spork ~ playPiano(r4, mnotes8[3], durs[i]);
            }
            else if(notes[i].charAt(1)-48 == 9) { // M9
                spork ~ playPiano(r1, mnotes9[0], durs[i]);
                spork ~ playPiano(r2, mnotes9[1], durs[i]);
                spork ~ playPiano(r3, mnotes9[2], durs[i]);
            }
            else if(notes[i].charAt(1)-48 == 10) { // M:
                spork ~ playPiano(r1, mnotes10[0], durs[i]);
                spork ~ playPiano(r2, mnotes10[1], durs[i]);
                spork ~ playPiano(r3, mnotes10[2], durs[i]);
            }
            else if(notes[i].charAt(1)-48 == 11) { // M;
                spork ~ playPiano(r1, mnotes11[0], durs[i]);
                spork ~ playPiano(r2, mnotes11[1], durs[i]);
                spork ~ playPiano(r3, mnotes11[2], durs[i]);
            }
            else if(notes[i].charAt(1)-48 == 12) { // M<
                spork ~ playPiano(r1, mnotes12[0], durs[i]);
                spork ~ playPiano(r2, mnotes12[1], durs[i]);
                spork ~ playPiano(r3, mnotes12[2], durs[i]);
            }
            else if(notes[i].charAt(1)-48 == 13) { // M=
                spork ~ playPiano(r1, mnotes13[0], durs[i]);
                spork ~ playPiano(r2, mnotes13[1], durs[i]);
                spork ~ playPiano(r3, mnotes13[2], durs[i]);
            }
            else if(notes[i].charAt(1)-48 == 14) { // M>
                spork ~ playPiano(r1, mnotes14[0], durs[i]);
                spork ~ playPiano(r2, mnotes14[1], durs[i]);
                spork ~ playPiano(r3, mnotes14[2], durs[i]);
                spork ~ playPiano(r4, mnotes14[3], durs[i]);
            }
            else if(notes[i].charAt(1)-48 == 15) { // M?
                spork ~ playPiano(r1, mnotes15[0], durs[i]);
                spork ~ playPiano(r2, mnotes15[1], durs[i]);
                spork ~ playPiano(r3, mnotes15[2], durs[i]);
            }
            else if(notes[i].charAt(1)-48 == 16) { // M@
                spork ~ playPiano(r1, mnotes16[0], durs[i]);
                spork ~ playPiano(r2, mnotes16[1], durs[i]);
                spork ~ playPiano(r3, mnotes16[2], durs[i]);
            }
            else if(notes[i].charAt(1)-48 == 17) { // MA
                spork ~ playPiano(r1, mnotes17[0], durs[i]);
                spork ~ playPiano(r2, mnotes17[1], durs[i]);
                spork ~ playPiano(r3, mnotes17[2], durs[i]);
            }
            else if(notes[i].charAt(1)-48 == 18) { // MB
                spork ~ playPiano(r1, mnotes18[0], durs[i]);
                spork ~ playPiano(r2, mnotes18[1], durs[i]);
                spork ~ playPiano(r3, mnotes18[2], durs[i]);
            }
            else if(notes[i].charAt(1)-48 == 19) { // MC
                spork ~ playPiano(r1, mnotes19[0], durs[i]);
                spork ~ playPiano(r2, mnotes19[1], durs[i]);
            }
            else if(notes[i].charAt(1)-48 == 20) { // MD
                spork ~ playPiano(r1, mnotes20[0], durs[i]);
                spork ~ playPiano(r2, mnotes20[1], durs[i]);
            }
            else if(notes[i].charAt(1)-48 == 21) { // ME
                spork ~ playPiano(r1, mnotes21[0], durs[i]);
                spork ~ playPiano(r2, mnotes21[1], durs[i]);
            }
            else if(notes[i].charAt(1)-48 == 22) { // MF
                spork ~ playPiano(r1, mnotes22[0], durs[i]);
                spork ~ playPiano(r2, mnotes22[1], durs[i]);
            }
            else if(notes[i].charAt(1)-48 == 23) { // MG
                spork ~ playPiano(r1, mnotes23[0], durs[i]);
                spork ~ playPiano(r2, mnotes23[1], durs[i]);
            }
            durs[i]::second => now;
        }
        else { // N
            0 => global_reverb.mix;
            if(notes[i].charAt(1)-48 == 4) { // N4
                spork ~ playPiano(r1, mnotes4[0], durs[i], 0.2);
                spork ~ playPiano(r2, mnotes4[1], durs[i], 0.14);
                spork ~ playPiano(r3, mnotes4[2], durs[i], 0.07);
                spork ~ playPiano(r4, mnotes4[3], durs[i], 0.0);
            }
            else if(notes[i].charAt(1)-48 == 7) { // N70
                spork ~ playPiano(r1, mnotes7[0], durs[i], 0.2);
                spork ~ playPiano(r2, mnotes7[1], durs[i], 0.16);
                spork ~ playPiano(r3, mnotes7[2], durs[i], 0.12);
                spork ~ playPiano(r4, mnotes7[3], durs[i], 0.08);
                spork ~ playPiano(r5, mnotes7[4], durs[i], 0.04);
                spork ~ playPiano(r6, mnotes7[5], durs[i], 0.0);
            }
            durs[i]::second => now;
        }
    }
}