/ DATAFLOW MODELLING
module(ouput y, input a);
  assign y= ~a;
endmodule

/ STRUCTURAL MODELLING
module(output y, input a);
  not n1(y,a);
endmodule

/ BEHAVIOURAL MODELLING
module not_gate(output reg y, input a);
  always @(*)
    y= ~a;
endmodule

/ TESTBENCH
`timescale 1ns / 1ps

module not_gate_tb;

    // Testbench signals
    reg a;
    reg b;
    wire y;

    // Instantiate the AND gate
    and_gate uut (
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin
        // Display header
        $display("Time\t a b | y");
        $display("----------------");

        // Apply test vectors
        a = 0; b = 0; #10; $display("%0t\t %b %b | %b", $time, a, b, y);
        a = 0; b = 1; #10; $display("%0t\t %b %b | %b", $time, a, b, y);
        a = 1; b = 0; #10; $display("%0t\t %b %b | %b", $time, a, b, y);
        a = 1; b = 1; #10; $display("%0t\t %b %b | %b", $time, a, b, y);

        // Finish simulation
        $finish;
    end

endmodule
