//consecutive wr and rd
class mem_sequence1 extends uvm_sequence#(mem_seq_item);
	mem_seq_item req[2];
	`uvm_object_utils(mem_sequence1)
	function new(string name ="mem_sequence1");
		super.new(name);
	endfunction

		virtual task body();
			req[0]= mem_seq_item :: type_id :: create("req[0]");
			req[1]= mem_seq_item :: type_id :: create("req[1]");
		repeat(10)begin
				start_item(req[0]);
				assert(req[0].randomize() with {(wr_en==1);
												(rd_en==0);});
				finish_item(req[0]);

				start_item(req[1]);
				assert(req[1].randomize() with {(wr_en==0);
											(rd_en==1);
												foreach(addr[i])
													addr[i] == req[0].addr[i];
												foreach(wdata[i])
													wdata[i] == req[0].wdata[i];}
												);
				finish_item(req[1]);
		
		end
		endtask
endclass
