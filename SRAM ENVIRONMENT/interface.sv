interface sram_interface(input bit clk,rst);
	logic [7:0]wdata;
	logic [7:0]rdata;
	logic [3:0] addr;
	logic wr_en;
	logic rd_en;
endinterface
