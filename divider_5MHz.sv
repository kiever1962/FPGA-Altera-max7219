module divider_5MHz (
       input        clock,
		 output logic div_clk = 1);
		 
		 bit       bit_divider   = 0;
       integer	  cnt_divider   = 0;
		 
		 always @(posedge clock)
         begin: divider_frq                  // named block
		//-------section of divide clk	
			 if(cnt_divider < 24999999) 
				cnt_divider = cnt_divider + 1;
          else
			   begin
            cnt_divider = 0;
		//--------Section of inversion of bit		
   	      if(bit_divider == 1)
				  begin
   	        bit_divider = 0;
			     div_clk    <= 0;
				  end
		      else
				  begin
		        bit_divider = 1;
			     div_clk    <= 1;
		        end;				
			   end;	  
         end
endmodule // top