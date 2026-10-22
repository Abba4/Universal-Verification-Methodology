`include"uvm_macros.svh"
import uvm_pkg::*;
`include"sequence_item.sv"
`include"sequence1.sv"
`include"sequencer.sv"
`include"driver.sv"
`include"monitor1.sv"
`include"active_agent.sv"
`include"monitor2.sv"
`include"passive_agent.sv"
`include"scoreboard.sv"
`include"subscriber.sv"
`include"environment.sv"
`include"test.sv"
`include"interface.sv"
`include"sram_dut.sv"
`include"assertion_file.sv"

module top;
bit clk,rst;
always #5 clk=~clk;
sram_interface intf(clk,rst);
	
	sram_dut dut(.clk(intf.clk), .rst(intf.rst), .addr(intf.addr), .wdata(intf.wdata) , .rdata(intf.rdata), .wr_en(intf.wr_en), .rd_en(intf.rd_en));
	
	bind sram_dut assertion_module a_bind(.clk(clk), .rst(rst), .wr_en(wr_en), .rd_en(rd_en), .addr(addr), .wdata(wdata));
	
	initial begin
		uvm_config_db#(virtual sram_interface)::set(null,"*","sram_interface",intf);
		clk=0;
		rst=1;
		#10;
		rst=0;
	end

initial begin
	run_test("test");
end
endmodule

