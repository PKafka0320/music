public class BPM {
    static float HN, QN, EN, SN, TN, SPT, SMT, EPS;
    75.0 => float beat;
    60.0 / beat => QN; // Second per Beat, 4, 0.8s
    QN * 2 => HN; // 8, 1.6s
    QN / 2 => EN; // 2, 0.4s
    QN / 4 => SN; // 1, 0.2s
    QN / 8 => TN; // 0.5, 0.1s
    SN + TN => SPT; // 1.5
    SN - TN => SMT; // 0.5
    EN + SN => EPS; // 3
}