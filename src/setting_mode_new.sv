module setting_mode_new (
    input logic clk,
    input logic rst_n,
    input logic button_mode,
    output logic [1:0] mode
);
//------------------------------
logic debounce_temp;
logic temp_reg;
//
debouncer debouncer_u1 (
    .clk(clk),
    .rst_n(rst_n),
    .i_debounce(button_mode),
    .o_debounce(debounce_temp)
);
//
debounce_fix x0 (
    .clk(clk),
    .in(debounce_temp),
    .out(temp_reg)
);
//
count_2b a0 (
    .clk(clk),
    .sec_en(temp_reg),
    .rst_n(rst_n),
    .mode(mode)
);
endmodule