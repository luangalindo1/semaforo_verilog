module SEMAFORO(clk, botao2, botao1, color, color2, cnt);

	input clk, botao1, botao2;
   output reg[1:0] color, color2;
	
	
  reg[1:0] state, nextState;
  output reg[3:0] cnt;
	
	
  	//estados
	always@(state, cnt)
		case(state)
        0: if(cnt == 3 ) nextState = 1;
		else nextState = 0;
        1: if(cnt == 6) nextState = 2;
		else nextState = 1;
        2: if(cnt == 10) nextState = 3;
		else nextState = 2;
        3: if(cnt == 15) nextState = 0;
        else nextState = 3;
		default: nextState = 0;
	endcase

	//atribui o proximo estado	
 	 always@(posedge clk or negedge botao1 or negedge botao2)
		if(botao1 == 0)state = 1;
	    else if(botao2 == 0) state = 3;
		else state = nextState;
	
  
  	//atribui aos led os estados  
	always@(state)
      begin 
        if(state == 0) begin 
          color = 2'b01;	  //verde 1
          color2 = 2'b11;end  //vermelho 2
        else if(state == 1)begin
          color = 2'b10;	  //laranja 1 
          color2 = 2'b11; end // vermelho 2
        else if(state == 2) begin
          color = 2'b11;	  //vermelho 1
          color2 = 2'b01;end  //verde 2
        else begin
          color = 2'b11;	  //vermelho 1 
          color2 = 2'b10; end //laranja 2
      end  
        
	//contador
 	 always@(posedge clk or negedge botao1 or negedge botao2)
    	if(botao1 == 0) cnt = 10;
  		else if(botao2 == 0) cnt = 22;
		else cnt = cnt + 1;
	 endmodule