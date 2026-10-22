class test extends uvm_test;
	`uvm_component_utils(test)
	environment env;
	mem_sequence1 seq1;
	//mem_sequence2 seq2;
	//mem_sequence3 seq3;
	function new(string name,uvm_component parent);
		super.new(name,parent);
	endfunction
	function void build_phase(uvm_phase phase);
		env=environment :: type_id :: create("env",this);

		`uvm_info(get_type_name(),"messasge from test build phase with none",UVM_NONE)
		`uvm_info(get_type_name(),"messasge from test build phase with low",UVM_LOW)
		`uvm_info(get_type_name(),"messasge from test build phase with medium",UVM_MEDIUM)
		`uvm_info(get_type_name(),"messasge from test build phase with high",UVM_HIGH)
	endfunction

	task run_phase(uvm_phase phase);
		seq1 = mem_sequence1 :: type_id :: create("seq1");
		//seq3 = mem_sequence3 :: type_id :: create("seq3",this);
		phase.raise_objection(this);
			//seq1.start(env.aagent.mem_sequr);
			seq1.start(env.aagent.mem_sequr);
			//#500;
			//seq3.start(env.aagent.mem_sequr);
		phase.drop_objection(this);
	endtask
endclass
