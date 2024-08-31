module en_5hz (
    input logic clk, // clock from kit, 50Mhz
    output logic en_5hz // generate 50Mhz to 1 positive clock
);
integer i;
//
always_ff@ (posedge clk) begin
    if (i == 10000000) begin i = 0; end
    else i = i + 1;
end

//
assign en_5hz = (i == 5000000) ? 1 : 0;
endmodule 