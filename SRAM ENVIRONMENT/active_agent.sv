class active_agent extends uvm_agent;

	`uvm_component_utils(active_agent)

	mem_sequencer mem_sequr;
	mem_driver mem_drv;
	monitor1  ip_monitor;

	function new(string name, uvm_component parent);
		super.new(name,parent);
	endfunction

	virtual function void build_phase(uvm_phase phase);
		mem_sequr = mem_sequencer :: type_id :: create("mem_sequr",this);
		mem_drv =mem_driver :: type_id :: create("mem_drv",this);
		ip_monitor=monitor1 :: type_id :: create("ip_monitor",this);

		super.build_phase(phase);
			`uvm_info(get_full_name(),"message from active agent build phase with none",UVM_NONE)
			`uvm_info(get_full_name(),"message from active agent build phase with low",UVM_LOW)
			`uvm_info(get_full_name(),"message from active agent build phase with medium",UVM_MEDIUM)
			`uvm_info(get_full_name(),"message from active agent build phase with high",UVM_HIGH)
			`uvm_info(get_full_name(),"message from active agent build phase with full",UVM_FULL)
			`uvm_info(get_full_name(),"message from active agent build phase with debug",UVM_DEBUG)
	endfunction

	virtual function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		mem_drv.seq_item_port.connect(mem_sequr.seq_item_export);
		`uvm_info(get_full_name(),"message from active agent connect phase with none",UVM_NONE)
	endfunction

	virtual task run_phase(uvm_phase phase);
		super.run_phase(phase);
			`uvm_info(get_full_name(),"message from active agent runphase with none",UVM_NONE)
			`uvm_info(get_full_name(),"message from active agent runphase with low",UVM_LOW)
			`uvm_info(get_full_name(),"message from active agent runphase with medium",UVM_MEDIUM)
			`uvm_info(get_full_name(),"message from active agent runphase with high",UVM_HIGH)
			`uvm_info(get_full_name(),"message from active agent runphase with full",UVM_FULL)
			`uvm_info(get_full_name(),"message from active agent runphase with debug",UVM_DEBUG)
	endtask

endclass
