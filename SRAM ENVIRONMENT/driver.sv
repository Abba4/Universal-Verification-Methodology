class mem_driver extends uvm_driver #(mem_seq_item);
	`uvm_component_utils(mem_driver)
	virtual sram_interface intf;
	function new(string name, uvm_component parent);
		super.new(name,parent);
	endfunction

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		if(!uvm_config_db#(virtual sram_interface)::get(this,"","sram_interface",intf))
		begin
			`uvm_error(get_type_name(),"config_db not retriving values")
		end
		`uvm_info(get_type_name(),"	MESSAGE IS FROM OLD DRIVER BUILD PHASE WITH NONE",UVM_NONE)
	endfunction

	virtual task run_phase(uvm_phase phase);
		super.run_phase(phase);
			forever begin
				seq_item_port.get_next_item(req);
				`uvm_info(get_type_name(),$sformatf("%s",req.sprint),UVM_NONE)
				@(posedge intf.clk);
					intf.wr_en <= req.wr_en;
					intf.rd_en <= req.rd_en;
					intf.addr <= req.addr;
					intf.wdata <= req.wdata;
					#1;
					`uvm_info(get_type_name(),$sformatf("addr=%0d,wdata=%0d,wr_en=%0d,rd_en=%0d",intf.addr,intf.wdata,intf.wr_en,intf.rd_en),UVM_NONE)

				seq_item_port.item_done();
			end
	endtask
endclass
