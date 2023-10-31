module SHOW_SIGNAL(S1, S2, LCD0, LCD1, LCD2, LCD3, LCD4, LCD5, LCD6, LCD7, LCD8, LCD9, LCD10, LCD11
                   , LCD12, LCD13, LCD14, LCD15, LCD16, LCD17, LCD18, LCD19, LCD20, LCD21
						 , LCD22, LCD23, LCD24, LCD25, LCD26, LCD27, LCD28, LCD29, LCD30, LCD31);

input [1:0] S1, S2;
output reg [7:0] LCD0, LCD1, LCD2, LCD3, LCD4, LCD5, LCD6, LCD7, LCD8, LCD9, LCD10, LCD11
                 , LCD12, LCD13, LCD14, LCD15, LCD16, LCD17, LCD18, LCD19, LCD20, LCD21
					  , LCD22, LCD23, LCD24, LCD25, LCD26, LCD27, LCD28, LCD29, LCD30, LCD31;
					  
always@(S1 or S2)
begin
	LCD0 <= 8'd83; // S
	LCD1 <= 8'd49; // 1
	LCD2 <= 8'd58; // :
	LCD3 <= 8'd32; // (SPACE)
	LCD16 <= 8'd83; // S
	LCD17 <= 8'd50; // 2
	LCD18 <= 8'd58; // :
	LCD19 <= 8'd32; // (SPACE)
	case(S1)
		2'b01: // VERDE
			begin
			LCD4 <= 8'd86; // V
			LCD5 <= 8'd69; // E
			LCD6 <= 8'd82; // R
			LCD7 <= 8'd68; // D
			LCD8 <= 8'd69; // E
			LCD9 <= 8'd32; // (SPACE)
			LCD10 <= 8'd32; // (SPACE)
			LCD11 <= 8'd32; // (SPACE)
			LCD12 <= 8'd32; // (SPACE)
			LCD13 <= 8'd32; // (SPACE)
			LCD14 <= 8'd32; // (SPACE)
			LCD15 <= 8'd32; // (SPACE)
			end
		2'b10: // LARANJA
			begin
			LCD4 <= 8'd76; // L
			LCD5 <= 8'd65; // A
			LCD6 <= 8'd82; // R
			LCD7 <= 8'd65; // A
			LCD8 <= 8'd78; // N
			LCD9 <= 8'd74; // J
			LCD10 <= 8'd65; // A
			LCD11 <= 8'd32; // (SPACE)
			LCD12 <= 8'd32; // (SPACE)
			LCD13 <= 8'd32; // (SPACE)
			LCD14 <= 8'd32; // (SPACE)
			LCD15 <= 8'd32; // (SPACE)
			end
		2'b11: // VERMELHO		
			begin
			LCD4 <= 8'd86; // V
			LCD5 <= 8'd69; // E
			LCD6 <= 8'd82; // R
			LCD7 <= 8'd77; // M
			LCD8 <= 8'd69; // E
			LCD9 <= 8'd76; // L
			LCD10 <= 8'd72; // H
			LCD11 <= 8'd79; // O
			LCD12 <= 8'd32; // (SPACE)
			LCD13 <= 8'd32; // (SPACE)
			LCD14 <= 8'd32; // (SPACE)
			LCD15 <= 8'd32; // (SPACE)
			end
	endcase	
	case(S2) 
		2'b01: // VERDE
			begin
			LCD20 <= 8'd86; // V
			LCD21 <= 8'd69; // E
			LCD22 <= 8'd82; // R
			LCD23 <= 8'd68; // D
			LCD24 <= 8'd69; // E
			LCD25 <= 8'd32; // (SPACE)
			LCD26 <= 8'd32; // (SPACE)
			LCD27 <= 8'd32; // (SPACE)
			LCD28 <= 8'd32; // (SPACE)
			LCD29 <= 8'd32; // (SPACE)
			LCD30 <= 8'd32; // (SPACE)
			LCD31 <= 8'd32; // (SPACE)
			end	
		2'b10: // LARANJA
			begin
			LCD20 <= 8'd76; // L
			LCD21	<= 8'd65; // A
			LCD22 <= 8'd82; // R
			LCD23 <= 8'd65; // A
			LCD24 <= 8'd78; // N
			LCD25 <= 8'd74; // J
			LCD26 <= 8'd65; // A
			LCD27 <= 8'd32; // (SPACE)
			LCD28 <= 8'd32; // (SPACE)
			LCD29 <= 8'd32; // (SPACE)
			LCD30 <= 8'd32; // (SPACE)
			LCD31 <= 8'd32; // (SPACE)
			end
		2'b11: // VERMELHO		
			begin
			LCD20 <= 8'd86; // V
			LCD21 <= 8'd69; // E
			LCD22 <= 8'd82; // R
			LCD23 <= 8'd77; // M
			LCD24 <= 8'd69; // E
			LCD25 <= 8'd76; // L
			LCD26 <= 8'd72; // H
			LCD27 <= 8'd79; // O
			LCD28 <= 8'd32; // (SPACE)
			LCD29 <= 8'd32; // (SPACE)
			LCD30 <= 8'd32; // (SPACE)
			LCD31 <= 8'd32; // (SPACE)
			end
	endcase
	end
	endmodule
	