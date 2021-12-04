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

["M1","-1", "-1"] @=> string notes1[];
["M2","-1", "-1"] @=> string notes2[];
["M3","-1", "-1"] @=> string notes3[];
["M4","-1", "-1"] @=> string notes4[];
["M1","M5","-1", "A3","-1","M5","-1"] @=> string notes5[];
["M2","M6","-1", "D3","-1","M7","-1"] @=> string notes6[];
["M3","M8","-1", "G3","-1","M8","-1"] @=> string notes7[];
["M4","M9","-1", "E3","-1","-1"] @=> string notes8[];
["M4","E2", "E2","-1","-1"] @=> string notes9[];
["M1","E4","M:","E4", "M1","E4","M:","E4"] @=> string notes10[];
["M2","D4","M;","D4", "M2","D4","M;","D4"] @=> string notes11[];
["M3","D4","M;","D4", "M3","D4","M;","D4"] @=> string notes12[];
["M4","B3","M<","B3", "E2","E3","-1"] @=> string notes13[];
["M3","B3","M=","B3", "M3","D4","-1"] @=> string notes14[];
["M1","E4","G4","E4", "M1","G4","F#4","D4"] @=> string notes15[];
["D2","D3","D4","D5","D4","D3", "D2","D4","G3","F#2"] @=> string notes16[];
["G2","G3","-1","G2","G3", "-1","G2","G2","F#3","D4"] @=> string notes17[];
["E2","E3", "-1"] @=> string notes18[];
["M3","D4","M;","D4", "G3","D4","M;","D4"] @=> string notes19[];
["M1","-1", "-1","G4","F#4","D4"] @=> string notes20[];
["D2","D4","D5","D4","D3", "-1","D4","G3","F#2"] @=> string notes21[];
["M1","E4","G4","E4", "A3","G4","F#4","D4"] @=> string notes22[];
["D2","D3","D4","D5","D4","D3", "-1","D4","G3","F#2"] @=> string notes23[];
["M1","E4","G4","E4", "M1","E4","G4","E4"] @=> string notes24[];
["M4","B3","M=","B3", "M4","B3","M=","B3"] @=> string notes25[];
["M2","D4","F#4","D4", "M2","D4","F#4","D4"] @=> string notes26[];
["M4","D4","G4","D4", "M4","D4","G4","D4"] @=> string notes27[];
["M3","D4","G4","D4", "M3","D4","G4","D4"] @=> string notes28[];
["M2","D4","M>","D4", "M2","D4","M;","D4"] @=> string notes29[];
["M3","D4","F#4","D4", "M3","D4","F#4","D4"] @=> string notes30[];
["M2","D4","F#4","D4", "M2","D4","G4","D4"] @=> string notes31[];
["M3","D4","A4","D4", "M3","D4","A4","D4"] @=> string notes32[];

[EN,EN,EN,EN, EN,EN,EN,EN] @=> float durs1[]; //10,11,12,15,19,23,25,26,27,28,29,30,31,32,33
[QN,QN, HN] @=> float durs2[]; // 1,2,3,4,18
[QN,EN,EN, EN,EN,EN,EN] @=> float durs3[]; // 5,6,7
[QN,EN,EN, EN,EN,QN] @=> float durs4[]; // 8
[QN,QN, QN,EN,EN] @=> float durs5[]; // 9
[EN,EN,EN,EN, EN,EN,QN] @=> float durs6[]; // 13,14,20
[EN,EN,SPT,SMT,SPT,SMT, EN,EN,EN,EN] @=> float durs7[]; // 16
[EPS,SN,SN,EN,SN, SN,EN,SN,EN,EN] @=> float durs8[]; // 17
[QN,QN, EN,EN,EN,EN] @=> float durs9[]; // 21
[QN,SPT,SMT,SPT,SMT, SN,EPS,EN,EN] @=> float durs10[]; // 22
[EN,EN,SPT,SMT,SPT,SMT, SN,EPS,EN,EN] @=> float durs11[]; // 24

while (true) {
    oin => now;
    while (oin.recv(msg) != 0) {
        msg.getInt(0) => int play;
        if (play == 1) {
            spork ~ piano(notes1, durs2);
        }
        else if (play == 2) {
            spork ~ piano(notes2, durs2);
        }
        else if (play == 3) {
            spork ~ piano(notes3, durs2);
        }
        else if (play == 4) {
            spork ~ piano(notes4, durs2);
        }
        else if (play == 5) {
            spork ~ piano(notes5, durs3);
        }
        else if (play == 6) {
            spork ~ piano(notes6, durs3);
        }
        else if (play == 7) {
            spork ~ piano(notes7, durs3);
        }
        else if (play == 8) {
            spork ~ piano(notes8, durs4);
        }
        else if (play == 9) {
            spork ~ piano(notes9, durs5);
        }
        else if (play == 10) {
            spork ~ piano(notes10, durs1);
        }
        else if (play == 11) {
            spork ~ piano(notes11, durs1);
        }
        else if (play == 12) {
            spork ~ piano(notes12, durs1);
        }
        else if (play == 13) {
            spork ~ piano(notes13, durs6);
        }
        else if (play == 14) {
            spork ~ piano(notes14, durs6);
        }
        else if (play == 15) {
            spork ~ piano(notes15, durs1);
        }
        else if (play == 16) {
            spork ~ piano(notes16, durs7);
        }
        else if (play == 17) {
            spork ~ piano(notes17, durs8);
        }
        else if (play == 19) {
            spork ~ piano(notes19, durs1);
        }
        else if (play == 20) {
            spork ~ piano(notes20, durs9);
        }
        else if (play == 21) {
            spork ~ piano(notes21, durs10);
        }
        else if (play == 22) {
            spork ~ piano(notes22, durs1);
        }
        else if (play == 23) {
            spork ~ piano(notes23, durs11);
        }
        else if (play == 24) {
            spork ~ piano(notes24, durs1);
        }
        else if (play == 25) {
            spork ~ piano(notes25, durs1);
        }
        else if (play == 26) {
            spork ~ piano(notes26, durs1);
        }
        else if (play == 27) {
            spork ~ piano(notes27, durs1);
        }
        else if (play == 28) {
            spork ~ piano(notes28, durs1);
        }
        else if (play == 29) {
            spork ~ piano(notes29, durs1);
        }
        else if (play == 30) {
            spork ~ piano(notes30, durs1);
        }
        else if (play == 31) {
            spork ~ piano(notes31, durs1);
        }
        else if (play == 32) {
            spork ~ piano(notes32, durs1);
        }
    }
}

fun void piano(string notes[], float durs[]) {
    for(0 => int i; i < notes.size(); i++) {
        if(notes[i].charAt(0)-77 != 0) { // not M
            spork ~ p.playPianor(r, notes[i], durs[i]);
            durs[i]::second => now;
        }
        else{ // M
            if(notes[i].charAt(1)-48 == 1) { // M1
                spork ~ p.playPianor(r1, mnotes1[0], durs[i]);
                spork ~ p.playPianor(r2, mnotes1[1], durs[i]);
            }
            else if(notes[i].charAt(1)-48 == 2) { // M2
                spork ~ p.playPianor(r1, mnotes2[0], durs[i]);
                spork ~ p.playPianor(r2, mnotes2[1], durs[i]);
            }
            else if(notes[i].charAt(1)-48 == 3) { // M3
                spork ~ p.playPianor(r1, mnotes3[0], durs[i]);
                spork ~ p.playPianor(r2, mnotes3[1], durs[i]);
            }
            else if(notes[i].charAt(1)-48 == 4) { // M4
                spork ~ p.playPianor(r1, mnotes4[0], durs[i]);
                spork ~ p.playPianor(r2, mnotes4[1], durs[i]);
            }
            else if(notes[i].charAt(1)-48 == 5) { // M5
                spork ~ p.playPianor(r1, mnotes5[0], durs[i]);
                spork ~ p.playPianor(r2, mnotes5[1], durs[i]);
                spork ~ p.playPianor(r3, mnotes5[1], durs[i]);
            }
            else if(notes[i].charAt(1)-48 == 6) { // M6
                spork ~ p.playPianor(r1, mnotes6[0], durs[i]);
                spork ~ p.playPianor(r2, mnotes6[1], durs[i]);
                spork ~ p.playPianor(r3, mnotes6[1], durs[i]);
            }
            else if(notes[i].charAt(1)-48 == 7) { // M7
                spork ~ p.playPianor(r1, mnotes7[0], durs[i]);
                spork ~ p.playPianor(r2, mnotes7[1], durs[i]);
                spork ~ p.playPianor(r3, mnotes7[1], durs[i]);
            }
            else if(notes[i].charAt(1)-48 == 8) { // M8
                spork ~ p.playPianor(r1, mnotes8[0], durs[i]);
                spork ~ p.playPianor(r2, mnotes8[1], durs[i]);
                spork ~ p.playPianor(r3, mnotes8[1], durs[i]);
            }
            else if(notes[i].charAt(1)-48 == 9) { // M9
                spork ~ p.playPianor(r1, mnotes9[0], durs[i]);
                spork ~ p.playPianor(r2, mnotes9[1], durs[i]);
                spork ~ p.playPianor(r3, mnotes9[1], durs[i]);
            }
            else if(notes[i].charAt(1)-48 == 10) { // M:
                spork ~ p.playPianor(r1, mnotes10[0], durs[i]);
                spork ~ p.playPianor(r2, mnotes10[1], durs[i]);
            }
            else if(notes[i].charAt(1)-48 == 11) { // M;
                spork ~ p.playPianor(r1, mnotes11[0], durs[i]);
                spork ~ p.playPianor(r2, mnotes11[1], durs[i]);
            }
            else if(notes[i].charAt(1)-48 == 12) { // M<
                spork ~ p.playPianor(r1, mnotes12[0], durs[i]);
                spork ~ p.playPianor(r2, mnotes12[1], durs[i]);
            }
            else if(notes[i].charAt(1)-48 == 13) { // M=
                spork ~ p.playPianor(r1, mnotes13[0], durs[i]);
                spork ~ p.playPianor(r2, mnotes13[1], durs[i]);
            }
            else if(notes[i].charAt(1)-48 == 14) { // M>
                spork ~ p.playPianor(r1, mnotes14[0], durs[i]);
                spork ~ p.playPianor(r2, mnotes14[1], durs[i]);
            }
            durs[i]::second => now;
        }
    }
}