module sec_en (
    input logic clk, // clock from kit, 50Mhz 
    output logic sec_en // generate 50Mhz to 1 positive clock
);
integer i;
//
always_ff@ (posedge clk) begin 
    if (i == 50000000) begin i = 0; end
    else i = i + 1;
end 

///
assign sec_en = (i == 25000000) ? 1 : 0;
endmodule 