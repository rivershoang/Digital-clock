module binary_gen (
    input logic [5:0] second,
    input logic [5:0] minute,
    input logic [5:0] hour,
    output logic [3:0] second_ones,
    output logic [3:0] second_tens,
    output logic [3:0] minute_ones,
    output logic [3:0] minute_tens,
    output logic [3:0] hour_ones,
    output logic [3:0] hour_tens
);
// 
binary2BCD u0 (
    .hex6bit(second),
    .ones(second_ones),
    .tens(second_tens)
);
//
binary2BCD u1 (
    .hex6bit(minute),
    .ones(minute_ones),
    .tens(minute_tens)
);
//
binary2BCD u2 (
    .hex6bit(hour),
    .ones(hour_ones),
    .tens(hour_tens)
);
//
endmodule 