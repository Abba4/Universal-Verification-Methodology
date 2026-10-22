module sram_dut(clk,rst,wr_en,rd_en,addr,wdata,rdata);
input clk,rst,wr_en,rd_en;
input [3:0]addr;
input [7:0]wdata;
output reg [7:0]rdata;
reg [7:0]mem[15:0];

always @(posedge clk)
begin
	if(rst)begin
		rdata<=0;	
	end
end

always @(posedge clk,addr,rd_en,wr_en)begin
	if(!rst && wr_en==1)begin
		mem[addr] <= wdata;
	end
	else if(!rst && rd_en==1)begin
		rdata <= mem[addr];
	end
end
endmodule
