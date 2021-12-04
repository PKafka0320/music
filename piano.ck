public class Piano {
    fun int midi(string name) {
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
        if(note == "-1") {
            durs::second => now;
        }
        else {
            Std.mtof(midi(note)) => instrument.freq;
            0.2 => instrument.noteOn;
            (durs-0.05)::second => now;
            1 => instrument.noteOff;
            0.05::second => now;
        }
    }
    
    fun void playPianor(StkInstrument instrument, string note, float durs) {
        if(note == "-1") {
            durs::second => now;
        }
        else {
            Std.mtof(midi(note)) => instrument.freq;
            0.4 => instrument.noteOn;
            (durs-0.05)::second => now;
            1 => instrument.noteOff;
            0.05::second => now;
        }
    }
    
    fun void playPiano(StkInstrument instrument, string note, float durs, float delay) {
        Std.mtof(midi(note)) => instrument.freq;
        1 => instrument.noteOff;
        delay::second => now;
        0.1 => instrument.noteOn;
        (durs-delay-0.05)::second => now;
        1 => instrument.noteOff;
        0.05::second => now;
    }
}