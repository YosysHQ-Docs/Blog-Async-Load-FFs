module dut (
	input clk1, clk2, arst,
	output reg [7:0] cnt1, cnt2
);
	always_ff @(posedge clk1 or posedge arst)
		if (arst)
			cnt1 <= 0;
		else
			cnt1 <= cnt1 + 7;
	
	always_ff @(posedge clk2 or posedge arst)
		if (arst)
			cnt2 <= cnt1;
		else
			cnt2 <= cnt2 + 11;
endmodule
