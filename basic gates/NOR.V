/ DATA FLOW MODELLING
module nor_gate_df(output y, input a, b);
  assign y = ~(a | b);
endmodule

/STRUCTURAL MODELLING
module nor_gate_str(output y, input a, b);
  wire w1;
  or g1(w1, a, b);
  not g2(y, w1);
endmodule
/BEHAVIOURAL MODELLING 
module nor_gate(output reg y, input a, b);
  always @(*)
    y = ~(a | b);
endmodule

TESTBENCH :
`timescale 1ns / 1ps

module gate_tb;

    reg a;
    reg b;
    wire y;

    // Change the module name here to test different versions
    xnor_gate uut (
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin
        $display("Time\t a b | y");
        $display("----------------");

        a = 0; b = 0; #10; $display("%0t\t %b %b | %b", $time, a, b, y);
        a = 0; b = 1; #10; $display("%0t\t %b %b | %b", $time, a, b, y);
        a = 1; b = 0; #10; $display("%0t\t %b %b | %b", $time, a, b, y);
        a = 1; b = 1; #10; $display("%0t\t %b %b | %b", $time, a, b, y);

        $finish;
    end

endmodule
Let me know if you want a testbench that compares all three modeling styles at once or includes waveform output.









