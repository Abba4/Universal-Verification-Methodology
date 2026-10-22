class mem_seq_item extends uvm_sequence_item;

	rand bit[3:0] addr;
	rand bit wr_en;
	rand bit rd_en;
	rand bit[7:0]wdata;
		 bit[7:0]rdata;


//utility and field macro registration
	`uvm_object_utils_begin(mem_seq_item)
		`uvm_field_int(addr,UVM_BIN | UVM_ALL_ON)
		`uvm_field_int(wr_en,UVM_BIN | UVM_ALL_ON)
		`uvm_field_int(rd_en,UVM_BIN | UVM_ALL_ON)
		`uvm_field_int(wdata,UVM_BIN | UVM_ALL_ON)
	`uvm_object_utils_end

//constructor
	function new(string name="mem_seq_item");
		super.new(name);
	endfunction

	constraint c_name{wr_en != rd_en;}
	constraint c_name2{wdata inside {[10:15]};}
	constraint c_name3{addr inside{[10:12]};}

endclass
