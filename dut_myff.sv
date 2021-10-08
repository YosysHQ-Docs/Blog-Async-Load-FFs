module dut (
	input clk1, clk2, arst,
	output reg [7:0] cnt1, cnt2
);
	myff ff1[7:0] (cnt1, cnt1 + 8'd  7, clk1, arst, 8'h 00),
	     ff2[7:0] (cnt2, cnt2 + 8'd 11, clk2, arst,   cnt1);
endmodule
