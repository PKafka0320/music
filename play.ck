OscOut piano;
1979 => int port;
piano.dest("localhost", port);
piano.start("/hotMilk");

while(true) {
    piano.add(1);
    piano.send();
    4.5::minute => now;
}