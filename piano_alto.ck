BPM t;
t.HN => float HN;
t.QN => float QN;
t.EN => float EN;
t.SN => float SN;
t.TN => float TN;
t.SPT => float SPT;
t.SMT => float SMT;
t.EPS => float EPS;
Piano p;

OscIn oin;
1979 => oin.port;
oin.addAddress("/hotMilk/piano/alto");
OscMsg msg;

NRev global_reverb => dac;
0.1 => global_reverb.mix;
Rhodey r => global_reverb;
Rhodey r1 => global_reverb;
Rhodey r2 => global_reverb;
Rhodey r3 => global_reverb;

["A3","A2"] @=> string mnotes1[]; // M1
["D3","D2"] @=> string mnotes2[]; // M2
["G3","G2"] @=> string mnotes3[]; // M3
["E3","E2"] @=> string mnotes4[]; // M4
["B4","G4","E4"] @=> string mnotes5[]; // M5
["B4","F#4","D4"] @=> string mnotes6[]; // M6
["A4","D#4","C4"] @=> string mnotes7[]; // M7
["A4","F#4","D4"] @=> string mnotes8[]; // M8
["G4","D4","B3"] @=> string mnotes9[]; // M9
["B4","G4"] @=> string mnotes10[]; // M:
["A4","F#4"] @=> string mnotes11[]; // M;
["G4","D4"] @=> string mnotes12[]; // M<
["A4","D4"] @=> string mnotes13[]; // M=
["B4","F#4"] @=> string mnotes14[]; // M>

[
"-1", // -1.1-
"-1", "-1",
"M1","-1", "-1",
"M2","-1", "-1",
"M3","-1", "-1",
"M4","-1", "-1", // -1.2-
"M1","-1", "-1",
"M2","-1", "-1",
"M3","-1", "-1",
"M4","-1", "-1",
"M1","M5","-1", "A3","-1","M5","-1", // -1.3-
"M2","M6","-1", "D3","-1","M7","-1",
"M3","M8","-1", "G3","-1","M8","-1",
"M4","M9","-1", "E3","-1","-1",
"M1","M5","-1", "A3","-1","M5","-1", // -1.4-
"M2","M6","-1", "D3","-1","M7","-1",
"M3","M8","-1", "G3","-1","M8","-1",
"M4","E2", "E2","-1","-1",
"M1","E4","M:","E4", "M1","E4","M:","E4", // -1.5-
"M2","D4","M;","D4", "M2","D4","M;","D4",
"M3","D4","M;","D4", "M3","D4","M;","D4",
"M4","B3","M<","B3", "E2","E3","-1", // -2.1-
"M1","E4","M:","E4", "M1","E4","M:","E4",
"M2","D4","M;","D4", "M2","D4","M;","D4",
"M3","D4","M;","D4", "M3","D4","M;","D4", // -2.2-
"M3","B3","M=","B3", "M3","D4","-1",
"M1","E4","G4","E4", "M1","G4","F#4","D4",
"D2","D3","D4","D5","D4","D3", "D2","D4","G3","F#2", // -2.3-
"G2","G3","-1","G2","G3", "-1","G2","G2","F#3","D4",
"E2","E3", "-1", // -2.4-
"M1","E4","M:","E4", "M1","E4","M:","E4",
"M2","D4","M;","D4", "M2","D4","M;","D4",
"M3","D4","M;","D4", "G3","D4","M;","D4", // -2.5-
"M4","B3","M=","B3", "M4","D4","-1",
"M1","-1", "-1","G4","F#4","D4",
"D2","D4","D5","D4","D3", "-1","D4","G3","F#2",
"G2","G3","-1","G2","G3", "-1","G2","G2","F#3","D4", // -3.1-
"E2","E3", "-1",
"M1","E4","G4","E4", "A3","G4","F#4","D4",
"D2","D3","D4","D5","D4","D3", "-1","D4","G3","F#2",  // -3.2-
"G2","G3","-1","G2","G3", "-1","G2","G2","F#3","D4",
"E2","E3", "-1",
"M1","M5","-1", "A3","-1","M5","-1",
"M2","M6","-1", "D3","-1","M7","-1", // -3.3-
"M3","M8","-1", "G3","-1","M8","-1",
"M4","M9","-1", "E3","-1","-1",
"M1","M5","-1", "A3","-1","M5","-1",
"M2","M6","-1", "D3","-1","M7","-1", // -3.4-
"M3","M8","-1", "G3","-1","M8","-1",
"M4","E2", "E2","-1","-1",
"M1","E4","G4","E4", "M1","E4","G4","E4",
"M2","D4","M;","D4", "M2","D4","M;","D4", // -3.5-
"M3","D4","M;","D4", "M3","D4","M;","D4",
"M4","B3","M=","B3", "M4","B3","M=","B3",
"M1","E4","G4","E4", "M1","E4","G4","E4",
"M2","D4","F#4","D4", "M2","D4","F#4","D4", // -4.1-
"M4","D4","G4","D4", "M4","D4","G4","D4",
"M3","D4","G4","D4", "M3","D4","G4","D4",
"M1","E4","G4","E4", "M1","E4","G4","E4",
"M2","D4","M>","D4", "M2","D4","M;","D4", // -4.2-
"M3","D4","F#4","D4", "M3","D4","F#4","D4",
"M4","B3","M=","B3", "M4","B3","M=","B3",
"M1","E4","G4","E4", "M1","E4","G4","E4",
"M2","D4","F#4","D4", "M2","D4","G4","D4", // -4.3-
"M4","D4","G4","D4", "M4","D4","G4","D4",
"M3","D4","A4","D4", "M3","D4","A4","D4",
"M1","-1", "-1",
"M2","-1", "-1", // -4.4-
"M3","-1", "-1",
"M4","-1", "-1",
"M1","-1", "-1",
"-1", "-1",
"M3","-1", "-1" // -4.5-
] @=> string anotes[];

// 16 per block (8 per half block)
[
HN, // -1.1-
HN, HN,
QN,QN, HN,
QN,QN, HN,
QN,QN, HN,
QN,QN, HN, // -1.2-
QN,QN, HN,
QN,QN, HN,
QN,QN, HN,
QN,QN, HN,
QN,EN,EN, EN,EN,EN,EN, // -1.3-
QN,EN,EN, EN,EN,EN,EN,
QN,EN,EN, EN,EN,EN,EN,
QN,EN,EN, EN,EN,QN,
QN,EN,EN, EN,EN,EN,EN, // -1.4-
QN,EN,EN, EN,EN,EN,EN,
QN,EN,EN, EN,EN,EN,EN,
QN,QN, QN,EN,EN,
EN,EN,EN,EN, EN,EN,EN,EN, // -1.5-
EN,EN,EN,EN, EN,EN,EN,EN,
EN,EN,EN,EN, EN,EN,EN,EN,
EN,EN,EN,EN, EN,EN,QN, // -2.1-
EN,EN,EN,EN, EN,EN,EN,EN,
EN,EN,EN,EN, EN,EN,EN,EN,
EN,EN,EN,EN, EN,EN,EN,EN, // -2.2-
EN,EN,EN,EN, EN,EN,QN,
EN,EN,EN,EN, EN,EN,EN,EN,
EN,EN,SPT,SMT,SPT,SMT, EN,EN,EN,EN, // -2.3-
EPS,SN,SN,EN,SN, SN,EN,SN,EN,EN,
QN,QN, HN, // -2.4-
EN,EN,EN,EN, EN,EN,EN,EN,
EN,EN,EN,EN, EN,EN,EN,EN,
EN,EN,EN,EN, EN,EN,EN,EN, // -2.5-
EN,EN,EN,EN, EN,EN,QN,
QN,QN, EN,EN,EN,EN,
QN,SPT,SMT,SPT,SMT, SN,EPS,EN,EN,
EPS,SN,SN,EN,SN, SN,EN,SN,EN,EN, // -3.1-
QN,QN, HN,
EN,EN,EN,EN, EN,EN,EN,EN,
EN,EN,SPT,SMT,SPT,SMT, SN,EPS,EN,EN, // -3.2-
EPS,SN,SN,EN,SN, SN,EN,SN,EN,EN,
QN,QN, HN,
QN,EN,EN, EN,EN,EN,EN,
QN,EN,EN, EN,EN,EN,EN, // -3.3-
QN,EN,EN, EN,EN,EN,EN,
QN,EN,EN, EN,EN,QN,
QN,EN,EN, EN,EN,EN,EN,
QN,EN,EN, EN,EN,EN,EN, // -3.4-
QN,EN,EN, EN,EN,EN,EN,
QN,QN, QN,EN,EN,
EN,EN,EN,EN, EN,EN,EN,EN,
EN,EN,EN,EN, EN,EN,EN,EN, // -3.5-
EN,EN,EN,EN, EN,EN,EN,EN,
EN,EN,EN,EN, EN,EN,EN,EN,
EN,EN,EN,EN, EN,EN,EN,EN,
EN,EN,EN,EN, EN,EN,EN,EN, // -4.1-
EN,EN,EN,EN, EN,EN,EN,EN,
EN,EN,EN,EN, EN,EN,EN,EN,
EN,EN,EN,EN, EN,EN,EN,EN,
EN,EN,EN,EN, EN,EN,EN,EN, // -4.2-
EN,EN,EN,EN, EN,EN,EN,EN,
EN,EN,EN,EN, EN,EN,EN,EN,
EN,EN,EN,EN, EN,EN,EN,EN,
EN,EN,EN,EN, EN,EN,EN,EN, // -4.3-
EN,EN,EN,EN, EN,EN,EN,EN,
EN,EN,EN,EN, EN,EN,EN,EN,
QN,QN, HN,
QN,QN, HN, // -4.4-
QN,QN, HN,
QN,QN, HN,
QN,QN, HN,
HN, HN,
QN,QN, HN // -4.5-
] @=> float adurs[];

while (true) {
    oin => now;
    while (oin.recv(msg) != 0) {
        msg.getInt(0) => int play;
        if (play) {
            spork ~ piano(anotes, adurs);
        }
    }
}

fun void piano(string notes[], float durs[]) {
    for(0 => int i; i < notes.size(); i++) {
        if(notes[i].charAt(0)-77 != 0) { // not M
            spork ~ p.playPiano(r, notes[i], durs[i]);
            durs[i]::second => now;
        }
        else{ // M
            if(notes[i].charAt(1)-48 == 1) { // M1
                spork ~ p.playPiano(r1, mnotes1[0], durs[i]);
                spork ~ p.playPiano(r2, mnotes1[1], durs[i]);
            }
            else if(notes[i].charAt(1)-48 == 2) { // M2
                spork ~ p.playPiano(r1, mnotes2[0], durs[i]);
                spork ~ p.playPiano(r2, mnotes2[1], durs[i]);
            }
            else if(notes[i].charAt(1)-48 == 3) { // M3
                spork ~ p.playPiano(r1, mnotes3[0], durs[i]);
                spork ~ p.playPiano(r2, mnotes3[1], durs[i]);
            }
            else if(notes[i].charAt(1)-48 == 4) { // M4
                spork ~ p.playPiano(r1, mnotes4[0], durs[i]);
                spork ~ p.playPiano(r2, mnotes4[1], durs[i]);
            }
            else if(notes[i].charAt(1)-48 == 5) { // M5
                spork ~ p.playPiano(r1, mnotes5[0], durs[i]);
                spork ~ p.playPiano(r2, mnotes5[1], durs[i]);
                spork ~ p.playPiano(r3, mnotes5[1], durs[i]);
            }
            else if(notes[i].charAt(1)-48 == 6) { // M6
                spork ~ p.playPiano(r1, mnotes6[0], durs[i]);
                spork ~ p.playPiano(r2, mnotes6[1], durs[i]);
                spork ~ p.playPiano(r3, mnotes6[1], durs[i]);
            }
            else if(notes[i].charAt(1)-48 == 7) { // M7
                spork ~ p.playPiano(r1, mnotes7[0], durs[i]);
                spork ~ p.playPiano(r2, mnotes7[1], durs[i]);
                spork ~ p.playPiano(r3, mnotes7[1], durs[i]);
            }
            else if(notes[i].charAt(1)-48 == 8) { // M8
                spork ~ p.playPiano(r1, mnotes8[0], durs[i]);
                spork ~ p.playPiano(r2, mnotes8[1], durs[i]);
                spork ~ p.playPiano(r3, mnotes8[1], durs[i]);
            }
            else if(notes[i].charAt(1)-48 == 9) { // M9
                spork ~ p.playPiano(r1, mnotes9[0], durs[i]);
                spork ~ p.playPiano(r2, mnotes9[1], durs[i]);
                spork ~ p.playPiano(r3, mnotes9[1], durs[i]);
            }
            else if(notes[i].charAt(1)-48 == 10) { // M:
                spork ~ p.playPiano(r1, mnotes10[0], durs[i]);
                spork ~ p.playPiano(r2, mnotes10[1], durs[i]);
            }
            else if(notes[i].charAt(1)-48 == 11) { // M;
                spork ~ p.playPiano(r1, mnotes11[0], durs[i]);
                spork ~ p.playPiano(r2, mnotes11[1], durs[i]);
            }
            else if(notes[i].charAt(1)-48 == 12) { // M<
                spork ~ p.playPiano(r1, mnotes12[0], durs[i]);
                spork ~ p.playPiano(r2, mnotes12[1], durs[i]);
            }
            else if(notes[i].charAt(1)-48 == 13) { // M=
                spork ~ p.playPiano(r1, mnotes13[0], durs[i]);
                spork ~ p.playPiano(r2, mnotes13[1], durs[i]);
            }
            else if(notes[i].charAt(1)-48 == 14) { // M>
                spork ~ p.playPiano(r1, mnotes14[0], durs[i]);
                spork ~ p.playPiano(r2, mnotes14[1], durs[i]);
            }
            durs[i]::second => now;
        }
    }
}