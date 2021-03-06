// Adder circuit
`define AND and #50
`define OR or #50
`define NOT not #50
module behavioralFullAdder
(
    output sum, 
    output carryout,
    input a, 
    input b, 
    input carryin
);
    // Uses concatenation operator and built-in '+'
    assign {carryout, sum}=a+b+carryin;
endmodule

module structuralFullAdder
(
    output sum, 
    output carryout,
    input a, 
    input b, 
    input carryin
);
    wire abSum;
    wire abXor;
    wire abCinXor;

    and andgate(abSum, a, b); //multiply a and b
    xor xorgate(abXor, a, b); //exclusive or for a, b
    and andgate(abCinXor, abXor, carryin); //multiply carryin and the xor value for a, b
    or orgate(carryout, abSum, abCinXor); //add the sum of a, b and the product of xor and carryin
    xor xorgate(sum, abXor, carryin); //xor the xor of a, b and carryin

endmodule
