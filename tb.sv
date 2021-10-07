module tb;
	reg clk1 = 0, clk2 = 0, arst = 0;
	wire [7:0] cnt1, cnt2;

	dut dut (clk1, clk2, arst, cnt1, cnt2);

	task do_clk1;
		clk1 = 1; #5; clk1 = 0; #5;
	endtask

	task do_clk2;
		clk2 = 1; #5; clk2 = 0; #5;
	endtask

	task do_arst;
			arst = 1; #5; arst = 0; #5;
`ifdef DOUBLE_ARST
			arst = 1; #5; arst = 0; #5;
`endif
	endtask

	initial begin
		// $dumpfile("sim.vcd");
		// $dumpvars(0, tb);
		#10;
		do_arst;		$display(cnt1, cnt2);
		repeat (5) do_clk1;	$display(cnt1, cnt2);
		do_arst;		$display(cnt1, cnt2, " <--");
		repeat (5) do_clk2;	$display(cnt1, cnt2);
		do_arst;		$display(cnt1, cnt2);
	end
endmodule
