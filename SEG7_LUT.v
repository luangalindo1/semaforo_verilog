module SEG7_LUT (oSEG, iDIG);
input 	[3:0]	iDIG;
output	[6:0]	oSEG;

reg	    [6:0]	oSEG;

always @(iDIG) begin
	case(iDIG)
		4'h0:    oSEG =  7'b1000000  ;
		4'h1:    oSEG = ~7'b0000110  ;	// ---[0]---
		4'h2:    oSEG = ~7'b1011011  ;	// |	     |
		4'h3:    oSEG = ~7'b1001111  ;	//[5]	    [1]
		4'h4:    oSEG = ~7'b1100110  ;	// |	     |
		4'h5:    oSEG = ~7'b1101101  ;	// ---[6]---
		4'h6:    oSEG =  7'b0000010  ;	// |  	   |
		4'h7:    oSEG = ~7'b0000111  ;	//[4]	    [2]
		4'h8:    oSEG =  7'b0000000  ;	// |	     |
		default: oSEG =  7'b0011000  ;	// ---[3]---
	endcase
end

endmodule

