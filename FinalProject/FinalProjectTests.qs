// Final Project Tests
// Seixas Aldrich

namespace FinalProject {

    open Microsoft.Quantum.Arithmetic;
    open Microsoft.Quantum.Preparation;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Random;

    @Test("QuantumSimulator")
    operation TwosComplementTest1 () : Unit {

        use targets = Qubit[4];

        // 1011 (-5)
        X(targets[0]);
        X(targets[2]);
        X(targets[3]);

        TwosComplement(targets);

        // 0101 (5)
        // Flipping 1 bits back to zero and then confirming they are all zeros
        X(targets[1]);
        X(targets[3]);

        AssertAllZero(targets);
    }

    @Test("QuantumSimulator")
    operation TwosComplementTest2 () : Unit {

        use targets = Qubit[4];

        // 0111 (7)
        X(targets[1]);
        X(targets[2]);
        X(targets[3]);

        TwosComplement(targets);

        // 1001 (-7)
        // Flipping 1 bits back to zero and then confirming they are all zeros
        X(targets[0]);
        X(targets[3]);

        AssertAllZero(targets);
    }

    @Test("QuantumSimulator")
    operation TwosComplementTest3 () : Unit {

        use targets = Qubit[16];

        // 0000000001011001 (89)
        X(targets[9]);
        X(targets[11]);
        X(targets[12]);
        X(targets[15]);

        TwosComplement(targets);

        // 1111111110100111 (-89)
        // Flipping 1 bits back to zero and then confirming they are all zeros
        X(targets[0]);
        X(targets[1]);
        X(targets[2]);
        X(targets[3]);
        X(targets[4]);
        X(targets[5]);
        X(targets[6]);
        X(targets[7]);
        X(targets[8]);
        X(targets[10]);
        X(targets[13]);
        X(targets[14]);
        X(targets[15]);

        AssertAllZero(targets);
    }

    @Test("QuantumSimulator")
    operation TwosComplementTest4 () : Unit {

        use targets = Qubit[16];

        // 11101000 (-24)
        X(targets[0]);
        X(targets[1]);
        X(targets[2]);
        X(targets[4]);

        TwosComplement(targets);

        // 00011000 (24)
        // Flipping 1 bits back to zero and then confirming they are all zeros
        X(targets[3]);
        X(targets[4]);

        AssertAllZero(targets);
    }

}
