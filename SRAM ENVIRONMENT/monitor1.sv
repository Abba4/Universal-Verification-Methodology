class monitor1 extends uvm_monitor;
virtual sram_interface intf;
mem_seq_item req;
//int count;
reg [7:0]mem[15:0];
`uvm_component_utils(monitor1)
uvm_analysis_port#(mem_seq_item) ipmn_port;
	function new(string name,uvm_component parent);
		super.new(name,parent);
	endfunction
	
	virtual function void build_phase(uvm_phase phase);
		req=mem_seq_item::type_id::create("req");
		super.build_phase(phase);
			`uvm_info(get_full_name(),"message from monitor1 build phase with none",UVM_NONE)
		ipmn_port=new("ipmn_port",this);
	endfunction

	virtual task run_phase(uvm_phase phase);

		super.run_phase(phase);
			`uvm_info(get_full_name(),"message from monitor1 runphase with none",UVM_NONE)
			
		if(!uvm_config_db#(virtual sram_interface)::get(this,"","sram_interface",intf))
		begin
			`uvm_error(get_type_name(),"config_db not retriving values")
		end
		forever begin	

				@(posedge intf.clk);
				//@(intf.wr_en, intf.rd_en, intf.addr, intf.wdata)
					req.wr_en <=intf.wr_en;
					req.rd_en <=intf.rd_en;
					req.addr <=intf.addr;
					req.wdata <=intf.wdata;
					req.rdata <= intf.rdata;
					#1;
					//count++;
					//`uvm_info(get_type_name,$sformatf("count=%0d",count),UVM_NONE);
					`uvm_info(get_type_name(),$sformatf("addr=%0d,wdata=%0d,wr_en=%0d,rd_en=%0d",req.addr,req.wdata,req.wr_en,req.rd_en),UVM_NONE)
					bfm(req);
					`uvm_info(get_type_name(),$sformatf("rdata=%d addr=%d",req.rdata,req.addr),UVM_NONE)
					ipmn_port.write(req);
		end
	endtask
	task bfm(mem_seq_item req);
		if(req.wr_en==1)begin
			mem[req.addr] <= req.wdata;
		end
		else if(req.rd_en==1)begin
			req.rdata <= mem[req.addr];
		end
	endtask
endclass
