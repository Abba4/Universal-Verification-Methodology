`uvm_analysis_imp_decl(_ipmn)
`uvm_analysis_imp_decl(_opmn)
class scoreboard extends uvm_scoreboard;
	`uvm_component_utils(scoreboard)
	
	uvm_analysis_imp_ipmn#(mem_seq_item,scoreboard) port1;
	uvm_analysis_imp_opmn#(mem_seq_item,scoreboard) port2;

	mem_seq_item ref_data;
	mem_seq_item dut_data;

	function new(string name, uvm_component parent);
		super.new(name,parent);
	endfunction

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info(get_full_name,"message from scoreboard build phase with none",UVM_NONE)
		ref_data=mem_seq_item::type_id::create("ref_data");
		dut_data=mem_seq_item::type_id::create("dut_data");
		port1=new("port1",this);
		port2=new("port2",this);
	endfunction

	task write_ipmn(mem_seq_item ref_data);
		this.ref_data=ref_data;
	endtask

	task write_opmn(mem_seq_item dut_data);
		this.dut_data=dut_data;

		if(ref_data.rdata==dut_data.rdata)begin
			`uvm_info(get_name,$sformatf("ref_data_rdata=%d dut_data.rdata=%d",ref_data.rdata,dut_data.rdata),UVM_NONE)
			`uvm_info(get_type_name,"-------------->>>>>>>>>>>TETS CASE PASS<<<<<<<<<<<<<<<<<<--------------------",UVM_NONE)
		end
		else begin
			`uvm_info(get_name,$sformatf("ref_data_rdata=%d dut_data.rdata=%d",ref_data.rdata,dut_data.rdata),UVM_NONE)
			`uvm_info(get_type_name,"-------------->>>>>>>>>>>TETS CASE FAIL<<<<<<<<<<<<<<<<<<--------------------",UVM_NONE)
		end
	endtask

	virtual task run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info(get_full_name(),"message from scoreboard build phase with none",UVM_NONE)
	endtask
endclass
