module assertion_module(input clk,rst,wr_en,rd_en,[3:0]addr,[7:0]wdata);
	
	property p1;
		@(posedge clk) rst |-> ##[0:10] !rst;
	endproperty

	property p2;
		@(posedge clk) wr_en |-> ##[0:10] !wr_en;
	endproperty

	property p3;
		@(posedge clk) rd_en |-> ##[0:10] !rd_en;
	endproperty

	property p4(clk);
		realtime a;
		@(posedge clk)
		(1,a=$realtime) |=> ($realtime-a) >=5;
	endproperty

	property p5;
		@(posedge clk) !rst |-> !($isunknown(wdata));
	endproperty

	a_1:assert property(p1);
	a_2:assert property(p2);
	a_3:assert property(p3);
	a_4:assert property(p4(clk));
	a_5:assert property(p5);

endmodule
