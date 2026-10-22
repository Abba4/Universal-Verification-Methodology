class monitor2 extends uvm_monitor;
	//int count;
	mem_seq_item req;
	virtual sram_interface intf;
	`uvm_component_utils(monitor2)
	uvm_analysis_port#(mem_seq_item) opmn_port;
	function new(string name, uvm_component parent);
		super.new(name,parent);
	endfunction

	virtual function void build_phase(uvm_phase phase);
	req=mem_seq_item::type_id::create("req");
		super.build_phase(phase);
		`uvm_info(get_full_name(),"message from monitor2 build phase with none",UVM_NONE)
		opmn_port=new("opmn_port",this);
	endfunction

	virtual task run_phase(uvm_phase phase);
		super.run_phase(phase);
			`uvm_info(get_full_name(),"message from monitor2 runphase with none",UVM_NONE)
		
		if(!uvm_config_db#(virtual sram_interface)::get(this,"*","sram_interface",intf))begin
			`uvm_error(get_type_name,"config_db interface data not retrevied")
		end
		forever begin
		@(posedge intf.clk);
		//@(intf.rdata)
			req.rdata <= intf.rdata;
			#1;
			//count++;
			//`uvm_info(get_type_name,$sformatf("count=%0d",count),UVM_NONE)
			`uvm_info(get_type_name(),$sformatf("rdata=%0d",req.rdata),UVM_NONE)
			opmn_port.write(req);
		end
	endtask

endclass
