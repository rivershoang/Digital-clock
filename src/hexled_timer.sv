module hexled_timer (
    input logic [3:0] bin0,bin1,bin2,bin3,bin4,bin5,
    output logic [6:0] hex0,hex1,hex2,hex3,hex4,hex5
);
//
hexled u0 (
    .bcd_i(bin0),
    .hex_o(hex0)
);
//
hexled u1 (
    .bcd_i(bin1),
    .hex_o(hex1)
);
//
hexled u2 (
    .bcd_i(bin2),
    .hex_o(hex2)
);
//
hexled u3 (
    .bcd_i(bin3),
    .hex_o(hex3)
);
//
hexled u4 (
    .bcd_i(bin4),
    .hex_o(hex4)
);
//
hexled u5 (
    .bcd_i(bin5),
    .hex_o(hex5)
);
//
endmodule 