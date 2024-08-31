module count_button (
    input logic CLOCK_50,
    input logic [0:0] SW,
    input logic [0:0] KEY,
    output logic [1:0] LEDG
);
setting_mode setting_mode_dut (
    .clk(CLOCK_50),
    .rst_n(SW[0]),
    .button_mode(KEY[0]),
    .mode(LEDG[1:0])
); 
endmodule