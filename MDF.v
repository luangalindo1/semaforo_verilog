module MDF(CLK_IN, CLK_OUT);

output reg CLK_OUT;
input CLK_IN;

reg [25:0] CONT;
reg RST;

initial
	begin
		RST = 0;
	end
always@(posedge CLK_IN or negedge RST)
	begin
		if (~RST)
		begin
			RST = 1;
			CONT = 25'b0;
			CLK_OUT = 0;
		end
		else 
			begin
				if (CONT == 25'd 24_999_999)
					begin
						CONT = 0;
						CLK_OUT = ~CLK_OUT;
					end
				else
				CONT = CONT + 1;
			end
	end
endmodule