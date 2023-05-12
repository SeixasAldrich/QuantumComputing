namespace EstimateTwosComplement {
    
    open Microsoft.Quantum.Arithmetic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Measurement;
    
    @EntryPoint()
    operation TwosComplement (register : Qubit[]) : Unit {

        // For N bits, (-2^(N-1)) <= a < = (2^(N-1) - 1)

        // Steps to Two's complement
        // 1. Flip each bit of number
        // 2. Add 1 to result, ignoring overflow

        let length = Length(register);

        // Flip each bit of the number

        ApplyToEach(X, register);

        use controlQubit = Qubit();

        X(controlQubit);

        // Add 1 to number

        for i in 0 .. length - 2 {

            Controlled CNOT(register[i + 1 .. length - 1],  (controlQubit, register[i]));

        }

        CNOT(controlQubit, register[length - 1]);

        // Make sure the control Qubit is in zero state when function ends
        X(controlQubit);

    }
}
