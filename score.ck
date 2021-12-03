OscOut piano_soprano, piano_alto;
1979 => int port;
piano_soprano.dest("localhost", port);
piano_alto.dest("localhost", port);

while(true) {
    piano_soprano.start("/hotMilk/piano/soprano");
    piano_alto.start("/hotMilk/piano/alto");
    piano_soprano.add(1);
    piano_alto.add(1);
    piano_soprano.send();
    piano_alto.send();
    4.5::minute => now;
}