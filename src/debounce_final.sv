module debounce_final (
    input logic clk,
    input logic button,
    output logic but_db
);
//
logic temp;
debounce_button u1 (
    .clk(clk),
    .button(button),
    .debounce(temp)
);
debounce_fix x1 (
    .clk(clk),
    .in(temp),
    .out(but_db)
);
endmodule 