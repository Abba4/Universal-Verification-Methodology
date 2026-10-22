class environment extends uvm_env;
	active_agent aagent;
	passive_agent pagent;
	scoreboard scbd;
	subscriber sub;
	`uvm_component_utils(environment)
	function new(string name,uvm_component parent);
		super.new(name,parent);
	endfunction

	virtual function void build_phase(uvm_phase phase);
		scbd = scoreboard :: type_id :: create("scbd",this);
		aagent = active_agent :: type_id :: create("aagent",this);
		pagent =  passive_agent :: type_id :: create("pagent",this);
		sub = subscriber :: type_id :: create("sub",this);
		super.build_phase(phase);
		`uvm_info(get_full_name(),"message from environment build phase with none",UVM_NONE)
	endfunction

	virtual function void connect_phase(uvm_phase phase);
		aagent.ip_monitor.ipmn_port.connect(scbd.port1);
		pagent.op_monitor.opmn_port.connect(scbd.port2);
		aagent.ip_monitor.ipmn_port.connect(sub.analysis_export);
	endfunction
		
	virtual task run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info(get_full_name(),"message from environment run phase with none",UVM_NONE)
	endtask
endclass
