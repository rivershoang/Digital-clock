module binary2BCD (
    input logic [5:0] hex6bit,
    output logic [3:0] ones, tens
);
//
integer i; 
logic [13:0] scratch_space;
//
always_comb 
begin 
    scratch_space = {8'b00000000,hex6bit};
    for (i=0;i<5;i=i+1) 
    begin 
        scratch_space = {scratch_space[12:0],1'b0};
        if (scratch_space [9:6] > 4)
        scratch_space[9:6] = scratch_space[9:6] + 3'b011;
    end
    scratch_space = {scratch_space[12:0],1'b0};
end
//
assign tens = scratch_space[13:10];
assign ones = scratch_space[9:6]; //| scratch_space[3:0] | scratch_space[5:2];
endmodule    