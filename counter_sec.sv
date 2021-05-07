module counter_sec (
       input         clock,
		 output  [31:0] data_out = 0);
		 
		 bit       bit_divider   = 0;
       integer	  cnt_divider   = 0;
		 integer   sec_counter   = 0;
		 
		 always @(posedge clock)
         begin: divider_frq                  // named block
		//-------section of divide clk	
			 if(cnt_divider < 12499999) 
				cnt_divider = cnt_divider + 1;
          else
			   begin
            cnt_divider = 0;
		//--------Section of inversion of bit		
   	      if(bit_divider == 1)
				  begin
   	        bit_divider = 0;
			     sec_counter = sec_counter + 1;
				  data_out <= sec_counter;
				  end
		      else
				  begin
		        bit_divider = 1;
			     end;				
			   end;	  
         end
endmodule // top