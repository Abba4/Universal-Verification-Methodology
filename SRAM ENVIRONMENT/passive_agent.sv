class passive_agent extends uvm_agent;
	`uvm_component_utils(passive_agent)

	monitor2 op_monitor;

	function new(string name, uvm_component parent);
		super.new(name,parent);
	endfunction

	virtual function void build_phase(uvm_phase phase);
		op_monitor=monitor2 :: type_id :: create("op_monitor",this);
		super.build_phase(phase);
			`uvm_info(get_full_name(),"message from passive agent build phase with none",UVM_NONE)
	endfunction

	virtual task run_phase(uvm_phase phase);
		super.run_phase(phase);
			`uvm_info(get_full_name(),"message from passive agent runphase with none",UVM_NONE)
	endtask
endclass
