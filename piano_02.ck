OscIn oin;
1979 => oin.port;
oin.addAddress("/hotMilk");
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
0.15 => global_reverb.mix;
Rhodey r => global_reverb;
Rhodey r1 => global_reverb;
Rhodey r2 => global_reverb;
Rhodey r3 => global_reverb;
Rhodey r4 => global_reverb;
Rhodey r5 => global_reverb;
Rhodey r6 => global_reverb;

["B50","G50","E50","C50"] @=> string mnotes10[];
["B51","G51","E51","C51"] @=> string mnotes11[];
["B50","F#50","D#50","C50"] @=> string mnotes20[];
["B51","F#51","D#51","C51"] @=> string mnotes21[];
["B50","A50","F#50","D50","B40"] @=> string mnotes30[];
["B51","A51","F#51","D51","B41"] @=> string mnotes31[];
["A50","G50","D50","B40"] @=> string mnotes40[];
["A51","G51","D51","B41"] @=> string mnotes41[];
["A50","F#50","D50","B40"] @=> string mnotes50[];
["A51","F#51","D51","B41"] @=> string mnotes51[];
["B60","F#60","D#60","C60"] @=> string mnotes60[];
["B61","F#61","D#61","C61"] @=> string mnotes61[];
["G70","D70","B60","G60","E60","E50"] @=> string mnotes70[];
["G71","D71","B61","G61","E61","E51"] @=> string mnotes71[];
["A50","F#50","D#50","C50"] @=> string mnotes80[];
["A51","F#51","D#51","C51"] @=> string mnotes81[];
["B50","F#50","C50"] @=> string mnotes90[];
["B51","F#51","C51"] @=> string mnotes91[];

[
"G70","F#70","D70","B60", // -1.1-
"A60", "-10","G60","A60","G70","F#70","D70","A60",
"M10","-10", "-10","G50","A50","G60","F#60","D60","A50",
"M20","-10", "A50","G50","D60",
"M30","-10", "-10","-10",
"M40","-10", "-10","G60","A60","G70","F#70","D70","A60", // -1.2-
"M10","-10", "D60","G50","G60","D60","B60","D#60","G60","A60",
"M20","D70", "E70","D70","B60","A60",
"M50","-10", "-10","-10",
"M40","-10", "-10","-10",
"M10","-10", "D60","G50","G60","D60","B60","D#60","G60","A60", // -1.3-
"M20","D70", "E70","D70","B60","A60",
"M50","-10", "-10","-10",
"M40","-10", "-10","G60","A60","G70","F#70","D70","A60",
"M10","-10", "D60","G50","G60","D60","B60","D#60","G60","A60", // -1.4-
"M20","D70", "E70","D70","B60","A60",
"M50","-10", "-10","-10",
"M40","-10", "-10","G60","A60","G70","F#70","D70","A60",
"M10","-10", "-10","G50","A50","G60","F#60","D60","A50", // -1.5-
"M20","G60","A60","G70","F#70","D70","A60", "A50","G50","D60",
"M30","G60","D70", "B60","-10",
"M40","-10", "-10","-10","D71","D71","D70", // -2.1-
"M10","-10", "-10","G50","A50","G60","F#60","D60","A50",
"M20","G70","F#70","D70","A60", "A50","G50","D60",
"M30","-10", "-10","-10", // -2.2-
"M40","-10", "-10","N40",
"M11","M11","-10","M11","M11","M11","-10","M11", "-10","M11","-10","M11","-10","M11",
"M21","M21","-10","M21","-10","M21","M61","M21", "-10","M21","M21","M21", // -2.3-
"M51","M51","-10","M51","-10","M51","-10", "M51","M51","-10","M51","-10","M51","-10",
"M41","-10","M41","-10","M41", "N71","G50","A50","G60","F#60","D60","A50", // -2.4-
"M20","G60","A60","G70","F#70","D70","A60", "-10","-10",
"M80","-10","F#50","D60", "M90","-10",
"M50","-10", "-10", // -2.5-
"M40","-10", "-10","N40",
"M10","-10", "-10","G60","A60","G70","F#70","D70","A60",
"M20","-10", "A50","G50","D60",
"M30" // -3.1-
] @=> string anotes[];

[
"M20","G60","A60","G70","F#70","D70","A60", "-10","-10"
] @=> string notes[];

// 16 per block (8 per half block)
[
EN,EN,EN,EN, // -1.1- 2,2,2,2 (half block)
HN, EN,SPT,SMT,SPT,SMT,SPT,SMT, // 8, 2,1.5,0.5,1.5,0.5,1.5,0.5
QN,QN, EN,SPT,SMT,SPT,SMT,SPT,SMT, // 4,4, 2,1.5,0.5,1.5,0.5,1.5,0.5
QN,QN, QN,EN,EN, // 4,4 4,2,2
QN,QN, QN,QN, // 4,4 4,4
QN,QN, EN,SPT,SMT,SPT,SMT,SPT,SMT, // -1.2- 4,4 2,1.5,0.5,1.5,0.5,1.5,0.5
QN,QN, SPT,SMT,SPT,SMT,SPT,SMT,SPT,SMT, // 4,4 1.5,0.5,1.5,0.5,1.5,0.5,1.5,0.5
QN,QN, EN,EN,EN,EN, // 4,4, 2,2,2,2
QN,QN, QN,QN, // 4,4, 4,4
QN,QN, QN,QN, // 4,4, 4,4
QN,QN, SPT,SMT,SPT,SMT,SPT,SMT,SPT,SMT, // -1.3- 4,4 1.5,0.5,1.5,0.5,1.5,0.5,1.5,0.5
QN,QN, EN,EN,EN,EN, // 4,4, 2,2,2,2
QN,QN, QN,QN, // 4,4, 4,4
QN,QN, EN,SPT,SMT,SPT,SMT,SPT,SMT, // 4,4 2,1.5,0.5,1.5,0.5,1.5,0.5
QN,QN, SPT,SMT,SPT,SMT,SPT,SMT,SPT,SMT, // -1.4- 4,4 1.5,0.5,1.5,0.5,1.5,0.5,1.5,0.5
QN,QN, EN,EN,EN,EN, // 4,4, 2,2,2,2
QN,QN, QN,QN, // 4,4, 4,4
QN,QN, EN,SPT,SMT,SPT,SMT,SPT,SMT, // 4,4 2,1.5,0.5,1.5,0.5,1.5,0.5
QN,QN, EN,SPT,SMT,SPT,SMT,SPT,SMT, // -1.5- 4,4 2,1.5,0.5,1.5,0.5,1.5,0.5
EN,SPT,SMT,SPT,SMT,SPT,SMT, QN,EN,EN, // 2,1.5,0.5,1.5,0.5,1.5,0.5 4,2,2
QN,EN,EN, QN,QN, // 4,2,2, 4,4
QN,QN, QN,SPT,SMT,SPT,SMT, // -2.1- 4,4 4,1.5,0.5,1.5,0.5
QN,QN, EN,SPT,SMT,SPT,SMT,SPT,SMT, // 4,4 2,1.5,0.5,1.5,0.5,1.5,0.5
QN,SPT,SMT,SPT,SMT, QN,EN,EN, // 4,1.5,0.5,1.5,0.5, 4,2,2
QN,QN, QN,QN, // -2.2- 4,4, 4,4
QN,QN, QN,QN, // 4,4, 4,4
SN,SN,SN,SN,SN,SN,SN,SN, SN,EN,SN,EN,SN,SN, // 1,1,1,1,1,1,1,1, 1,2,1,2,1,1
SN,SN,SN,SN,SN,SN,SN,SN, EN,EN,EN,EN, // -2.3- 1,1,1,1,1,1,1,1, 2,2,2,2
SN,SN,SN,SN,SN,EN,SN, SN,SN,SN,SN,SN,EN,SN, // 1,1,1,1,1,2,1, 1,1,1,1,1,2,1
EN,SN,EN,SN,EN, EN,SPT,SMT,SPT,SMT,SPT,SMT, // -2.4- 2,1,2,1,2, 2,1.5,0.5,1.5,0.5,1.5,0.5
EN,SPT,SMT,SPT,SMT,SPT,SMT, QN,QN, // 2,1.5,0.5,1.5,0.5,1.5,0.5, 4,4
EN,EN,EN,EN, QN,QN, // 2,2,2,2, 4,4
QN,QN, HN, // -2.5- 4,4, 8
QN,QN, QN,QN, // 4,4, 4,4
QN,QN, EN,SPT,SMT,SPT,SMT,SPT,SMT, // 4,4, 2,1.5,0.5,1.5,0.5,1.5,0.5
QN,QN, QN,EN,EN, // 4,4 4,2,2
QN,QN, HN // -3.1- 4,4, 8
] @=> float adurs[];

[
EN,SPT,SMT,SPT,SMT,SPT,SMT, QN,QN // 2,1.5,0.5,1.5,0.5,1.5,0.5, 4,4
] @=> float durs[];

while (true) {
    oin => now;
    while (oin.recv(msg) != 0) {
        msg.getInt(0) => int play;
        if (play) {
            //spork ~ piano(notes, durs);
            spork ~ piano(notes, durs);
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

fun void playPiano(StkInstrument instrument, string note, float durs) {
    Std.mtof(midi(note)) => instrument.freq;
    if(!(note.charAt(note.length()-1)-48)) { // 0
        0.1 => instrument.noteOn;
        durs::second => now;
    }
    else { // 1
        0.1 => instrument.noteOn;
        (durs-TN)::second => now;
        1 => instrument.noteOff;
        TN::second => now;
    }
}

fun void playPiano(StkInstrument instrument, string note, float durs, float delay) {
    Std.mtof(midi(note)) => instrument.freq;
    1 => instrument.noteOff;
    delay::second => now;
    if(!(note.charAt(note.length()-1)-48)) { // 0
        0.2 => instrument.noteOn;
        (durs-delay)::second => now;
    }
    else { // 1
        0.2 => instrument.noteOn;
        (durs-TN)::second => now;
        1 => instrument.noteOff;
        TN::second => now;
    }
}

fun void piano(string notes[], float durs[]) {
    for(0 => int i; i < notes.size(); i++) {
        if(notes[i].charAt(0)-77 != 0 && notes[i].charAt(0)-77 != 1) { // not M,N
            spork ~ playPiano(r, notes[i], durs[i]);
            durs[i]::second => now;
        }
        else if (notes[i].charAt(0)-77 == 0) { // M
            if(notes[i].charAt(1)-48 == 1) { // M1
                if(notes[i].charAt(2)-48 == 0) { // M10
                    spork ~ playPiano(r1, mnotes10[0], durs[i]);
                    spork ~ playPiano(r2, mnotes10[1], durs[i]);
                    spork ~ playPiano(r3, mnotes10[2], durs[i]);
                    spork ~ playPiano(r4, mnotes10[3], durs[i]);
                }
                else { // M11
                    spork ~ playPiano(r1, mnotes11[0], durs[i]);
                    spork ~ playPiano(r2, mnotes11[1], durs[i]);
                    spork ~ playPiano(r3, mnotes11[2], durs[i]);
                    spork ~ playPiano(r4, mnotes11[3], durs[i]);
                }
            }
            else if(notes[i].charAt(1)-48 == 2) { // M2
                if(notes[i].charAt(2)-48 == 0) { // M20
                    spork ~ playPiano(r1, mnotes20[0], durs[i]);
                    spork ~ playPiano(r2, mnotes20[1], durs[i]);
                    spork ~ playPiano(r3, mnotes20[2], durs[i]);
                    spork ~ playPiano(r4, mnotes20[3], durs[i]);
                }
                else{ // M21
                    spork ~ playPiano(r1, mnotes21[0], durs[i]);
                    spork ~ playPiano(r2, mnotes21[1], durs[i]);
                    spork ~ playPiano(r3, mnotes21[2], durs[i]);
                    spork ~ playPiano(r4, mnotes21[3], durs[i]);
                }
            }
            else if(notes[i].charAt(1)-48 == 3) { // M3
                if(notes[i].charAt(2)-48 == 0) { // M30
                    spork ~ playPiano(r1, mnotes30[0], durs[i]);
                    spork ~ playPiano(r2, mnotes30[1], durs[i]);
                    spork ~ playPiano(r3, mnotes30[2], durs[i]);
                    spork ~ playPiano(r4, mnotes30[3], durs[i]);
                    spork ~ playPiano(r5, mnotes30[4], durs[i]);
                }
                else { // M31
                    spork ~ playPiano(r1, mnotes31[0], durs[i]);
                    spork ~ playPiano(r2, mnotes31[1], durs[i]);
                    spork ~ playPiano(r3, mnotes31[2], durs[i]);
                    spork ~ playPiano(r4, mnotes31[3], durs[i]);
                    spork ~ playPiano(r5, mnotes31[4], durs[i]);
                }
            }
            else if(notes[i].charAt(1)-48 == 4) { // M4
                if(notes[i].charAt(2)-48 == 0) { // M40
                    spork ~ playPiano(r1, mnotes40[0], durs[i]);
                    spork ~ playPiano(r2, mnotes40[1], durs[i]);
                    spork ~ playPiano(r3, mnotes40[2], durs[i]);
                    spork ~ playPiano(r4, mnotes40[3], durs[i]);
                }
                else { // M41
                    spork ~ playPiano(r1, mnotes41[0], durs[i]);
                    spork ~ playPiano(r2, mnotes41[1], durs[i]);
                    spork ~ playPiano(r3, mnotes41[2], durs[i]);
                    spork ~ playPiano(r4, mnotes41[3], durs[i]);
                }
            }
            else if(notes[i].charAt(1)-48 == 5) { // M5
                if(notes[i].charAt(2)-48 == 0) { // M50
                    spork ~ playPiano(r1, mnotes50[0], durs[i]);
                    spork ~ playPiano(r2, mnotes50[1], durs[i]);
                    spork ~ playPiano(r3, mnotes50[2], durs[i]);
                    spork ~ playPiano(r4, mnotes50[3], durs[i]);
                }
                else { // M51
                    spork ~ playPiano(r1, mnotes51[0], durs[i]);
                    spork ~ playPiano(r2, mnotes51[1], durs[i]);
                    spork ~ playPiano(r3, mnotes51[2], durs[i]);
                    spork ~ playPiano(r4, mnotes51[3], durs[i]);
                }
            }
            else if(notes[i].charAt(1)-48 == 6) { // M6
                if(notes[i].charAt(2)-48 == 0) { // M60
                    spork ~ playPiano(r1, mnotes60[0], durs[i]);
                    spork ~ playPiano(r2, mnotes60[1], durs[i]);
                    spork ~ playPiano(r3, mnotes60[2], durs[i]);
                    spork ~ playPiano(r4, mnotes60[3], durs[i]);
                }
                else { // M61
                    spork ~ playPiano(r1, mnotes61[0], durs[i]);
                    spork ~ playPiano(r2, mnotes61[1], durs[i]);
                    spork ~ playPiano(r3, mnotes61[2], durs[i]);
                    spork ~ playPiano(r4, mnotes61[3], durs[i]);
                }
            }
            else if(notes[i].charAt(1)-48 == 8) { // M8
                if(notes[i].charAt(2)-48 == 0) { // M80
                    spork ~ playPiano(r1, mnotes80[0], durs[i]);
                    spork ~ playPiano(r2, mnotes80[1], durs[i]);
                    spork ~ playPiano(r3, mnotes80[2], durs[i]);
                    spork ~ playPiano(r4, mnotes80[3], durs[i]);
                }
                else { // M81
                    spork ~ playPiano(r1, mnotes81[0], durs[i]);
                    spork ~ playPiano(r2, mnotes81[1], durs[i]);
                    spork ~ playPiano(r3, mnotes81[2], durs[i]);
                    spork ~ playPiano(r4, mnotes81[3], durs[i]);
                }
            }
            else if(notes[i].charAt(1)-48 == 9) { // M9
                if(notes[i].charAt(2)-48 == 0) { // M90
                    spork ~ playPiano(r1, mnotes90[0], durs[i]);
                    spork ~ playPiano(r2, mnotes90[1], durs[i]);
                    spork ~ playPiano(r3, mnotes90[2], durs[i]);
                }
                else { // M91
                    spork ~ playPiano(r1, mnotes91[0], durs[i]);
                    spork ~ playPiano(r2, mnotes91[1], durs[i]);
                    spork ~ playPiano(r3, mnotes91[2], durs[i]);
                }
            }
            durs[i]::second => now;
        }
        else { // N
            if(notes[i].charAt(1)-48 == 4) { // N40
                spork ~ playPiano(r1, mnotes40[0], durs[i], 0.2);
                spork ~ playPiano(r2, mnotes40[1], durs[i], 0.14);
                spork ~ playPiano(r3, mnotes40[2], durs[i], 0.07);
                spork ~ playPiano(r4, mnotes40[3], durs[i], 0.0);
            }
            else if(notes[i].charAt(1)-48 == 7) { // N70
                spork ~ playPiano(r1, mnotes71[0], durs[i], 0.4);
                spork ~ playPiano(r2, mnotes71[1], durs[i], 0.32);
                spork ~ playPiano(r3, mnotes71[2], durs[i], 0.24);
                spork ~ playPiano(r4, mnotes71[3], durs[i], 0.16);
                spork ~ playPiano(r5, mnotes71[4], durs[i], 0.08);
                spork ~ playPiano(r6, mnotes71[5], durs[i], 0.0);
            }
            durs[i]::second => now;
        }
    }
}