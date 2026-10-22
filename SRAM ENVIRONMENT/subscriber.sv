class subscriber extends uvm_subscriber#(mem_seq_item);
	`uvm_component_utils(subscriber)

	mem_seq_item req;

	covergroup cvg;
		cp1: coverpoint req.wr_en{bins we=(1=>0);}
		cp2: coverpoint req.rd_en;
		cp3: coverpoint req.addr{bins addr1={[0:7]};
								 bins addr2={[8:15]};}
		cp4: coverpoint req.wdata{bins w1={[0:15]};
									illegal_bins w2={16};}

		cp5: cross cp3,cp4;
	endgroup

	function new(string name,uvm_component parent);
		super.new(name,parent);
		cvg=new();
	endfunction

	virtual function void write(mem_seq_item t);
		req=t;
		cvg.sample();
	endfunction
endclass
