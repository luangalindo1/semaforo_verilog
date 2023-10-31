module Mod_Teste (//adaptado por Danilo G.
 //////////////////// Fonte de Clock ////////////////////
		 CLOCK_27,    // 27 MHz
		 CLOCK_50,    // 50 MHz
		 //////////////////// Push Button    ////////////////////
		 KEY,         // Pushbutton (botoes) [3:0]
		 //////////////////// Chaves DPDT
		 SW,         // Toggle Switch (chaves) [17:0]
		 /////////////////// Display de 7-SEG ///////////////////
		 HEX0,       // Display 0
		 HEX1,       // Display 1
		 HEX2,       // Display 2
		 HEX3,       // Display 3
		 HEX4,       // Display 4
		 HEX5,       // Display 5
		 HEX6,       // Display 6
		 HEX7,       // Display 7
		 /////////////////// LED //////////////////
		 LEDG,       // LED Green (verde) [8:0]
		 LEDR,       // LED Red (vermelho) [17:0]
		 ////////////////////	LCD Module 16X2		////////////////
		 LCD_ON,							//	LCD Power ON/OFF
		 LCD_BLON,						//	LCD Back Light ON/OFF
		 LCD_RW,							//	LCD Read/Write Select, 0 = Write, 1 = Read
	    LCD_EN,							//	LCD Enable
		 LCD_RS,							//	LCD Command/Data Select, 0 = Command, 1 = Data
		 LCD_DATA,						//	LCD Data bus 8 bits
		 GPIO_0,							// GPIO
		 GPIO_1,			
	);


   input CLOCK_27;
   input CLOCK_50;

   input [3:0] KEY;
   input [17:0] SW;

   output [6:0] HEX0;
   output [6:0] HEX1;
   output [6:0] HEX2;
   output [6:0] HEX3;
   output [6:0] HEX4;
   output [6:0] HEX5;
	output [6:0] HEX6;
	output [6:0] HEX7;
	
	output [8:0] LEDG;
	output [17:0] LEDR;


// Parte 2
	////////////////////	LCD Module 16X2	////////////////////////////
	inout	[7:0]		LCD_DATA;				//	LCD Data bus 8 bits
	output			LCD_ON;					//	LCD Power ON/OFF
	output			LCD_BLON;				//	LCD Back Light ON/OFF
	output			LCD_RW;					//	LCD Read/Write Select, 0 = Write, 1 = Read
	output			LCD_EN;					//	LCD Enable
	output			LCD_RS;					//	LCD Command/Data Select, 0 = Command, 1 = Data
////////////////////////	GPIO	////////////////////////////////
	inout	[35:0]	GPIO_0;					//	GPIO Connection 0
	inout	[35:0]	GPIO_1;					//	GPIO Connection 1
////////////////////////////////////////////////////////////////////

//	All inout port turn to tri-state	
	assign	GPIO_1		=	36'hzzzzzzzzz;
	assign	GPIO_0		=	36'hzzzzzzzzz;	
	
	//	LCD 
	assign	LCD_ON		=	1'b1;
	assign	LCD_BLON		=	1'b1;
	
	LCD_TEST 			u5	(	
	
							//	Host Side
							.iCLK  	( CLOCK_50 ),
							.iRST_N	( KEY[0] ),
							
							.d000 (d000),		//		P		
							.d001 (d001),		//		r		
							.d002 (d002),		//		i		
							.d003 (d003),		//		m		
							.d004 (d004),		//		e		
							.d005 (d005),		//		i		
							.d006 (d006),		//		r		
							.d007 (d007),		//		a		
							.d008 (d008),		//		 		
							.d009 (d009),		//		L		
							.d010 (d010),		//		i		
							.d011 (d011),		//		n		
							.d012 (d012),		//		h		
							.d013 (d013),		//		a		
							.d014 (d014),		//		!		
							.d015 (d015),		//		 		
							
							.d100 (d100),		//		~	
							.d101 (d101),		//		S		
							.d102 (d102),		//		e		
							.d103 (d103),		//		g		
							.d104 (d104),		//		u		
							.d105 (d105),		//		n		
							.d106 (d106),		//		d		
							.d107 (d107),		//		a		
							.d108 (d108),		//				
							.d109 (d109),		//		L		
							.d110 (d110),		//		i		
							.d111 (d111),		//		n	
							.d112 (d112),		//		h		
							.d113 (d113),		//		a		
							.d114 (d114),		//		!		
							.d115 (d115),		//		 		
							
							//	LCD Side
							
							.LCD_DATA( LCD_DATA ),
							.LCD_RW  ( LCD_RW ),
							.LCD_EN	( LCD_EN ),
							.LCD_RS  ( LCD_RS )	
							);
							
							
							
							
	wire [7:0] d000,d001,d002,d003,d004,d005,d006,d007,d008,d009,d010,d011,d012,d013,d014,d015,d100,d101,d102,d103,d104,d105,d106,d107,d108,d109,d110,d111,d112,d113,d114,d115;
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////AQUI � ONDE SE ATRIBUI OS VALORES PARA O DISPLAY///////////////////////////
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//Data to display	//	Escrever a letra de acordo com a tabela ASCII
			
wire clk, botao1, botao2;
wire [1:0] color, color2;

assign botao1 = KEY[0];
assign botao2 = KEY[1];

wire[3:0] cnt;


MDF(CLOCK_50, clk);
SEMAFORO(clk, botao2, botao1, color, color2, cnt);
SHOW_SIGNAL(color, color2, d000, d001, d002, d003, d004, d005, d006, d007, d008, d009
				, d010, d011, d012, d013, d014, d015, d100, d101, d102, d103, d104, d105
				, d106, d107, d108, d109, d110, d111, d112, d113, d114, d115);

assign LEDR[1:0] = color;
assign LEDR[5:4] = color2;


SEG7_LUT dS1(HEX1, cnt/6'd10);
SEG7_LUT dS0(HEX0, cnt%6'd10);
			
endmodule
