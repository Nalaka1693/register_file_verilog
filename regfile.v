module stimulus;
	reg [31:0] WriteData;
	reg [4:0] ReadRegNum1, ReadRegNum2, WriteRegNum;
	reg Clock, RegWrite;
	wire [31:0] ReadData1, ReadData2;

	REG_FILE regf0 (ReadData1, ReadData2, ReadRegNum1, ReadRegNum2, WriteData, WriteRegNum, RegWrite); //insatance

	always 
		#5 Clock = ~ Clock;

	initial
	begin
		$dumpfile ("test_regft.vcd");
		$dumpvars (0, stimulus);
		#0 Clock = 0;
		#0 RegWrite = 1'b1;
		
		#5 WriteRegNum = 5'd0;
		#0 WriteData = 32'd0;

		#5 RegWrite = 1'b0;
		#0 RegWrite = 1'b1;

		#5 WriteRegNum = 5'd0;
		#0 WriteData = 32'd0;
		
		#4 WriteRegNum = 5'd1;
		#0 WriteData = 32'd1;
		
		#4 WriteRegNum = 5'd2;
		#0 WriteData = 32'd2;
		
		#4 WriteRegNum = 5'd3;
		#0 WriteData = 32'd3;
		
		#4 WriteRegNum = 5'd4;
		#0 WriteData = 32'd4;
		
		#4 WriteRegNum = 5'd5;
		#0 WriteData = 32'd5;
		
		#5 ReadRegNum1 = 5'd0;
		#0 ReadRegNum2 = 5'd1;
		#0 $display("RegNum\tData");
 		#5 $display ("%b\t%b", ReadRegNum1, ReadData1);
		#5 $display ("%b\t%b", ReadRegNum2, ReadData2);
		
		#5 ReadRegNum1 = 5'd2;
		#0 ReadRegNum2 = 5'd3;
		#5 $display ("%b\t%b", ReadRegNum1, ReadData1);
		#5 $display ("%b\t%b", ReadRegNum2, ReadData2);
		
		#5 ReadRegNum1 = 5'd4;
		#0 ReadRegNum2 = 5'd5;
		#5 $display ("%b\t%b", ReadRegNum1, ReadData1);
		#5 $display ("%b\t%b", ReadRegNum2, ReadData2);
		
		#4 WriteRegNum = 5'd1;
		#0 WriteData = 32'd1048575;		
		#0 ReadRegNum1 = 5'd1;
		#5 $display ("\n%b\t%b", ReadRegNum1, ReadData1);
		#5 $finish;
	end
endmodule

module REG_FILE (ReadData1, ReadData2, ReadRegNum1, ReadRegNum2, WriteData, WriteRegNum, RegWrite);
	/*register file contain 32, 32 bit registers, two read ports, one write port*/
	output [31:0] ReadData1, ReadData2;
	input [4:0] ReadRegNum1, ReadRegNum2, WriteRegNum;
	input [31:0] WriteData;
	input RegWrite;
	
	wire [31:0] regOut [31:0];
	wire [31:0] decodeOut, andOut;
	
	DECODER_32 decode0 (decodeOut, WriteRegNum[4], WriteRegNum[3], WriteRegNum[2], WriteRegNum[1], WriteRegNum[0]);
	
	and(andOut[0],  decodeOut[0],  RegWrite);
	and(andOut[1],  decodeOut[1],  RegWrite);
	and(andOut[2],  decodeOut[2],  RegWrite);
	and(andOut[3],  decodeOut[3],  RegWrite);
	and(andOut[4],  decodeOut[4],  RegWrite);
	and(andOut[5],  decodeOut[5],  RegWrite);
	and(andOut[6],  decodeOut[6],  RegWrite);
	and(andOut[7],  decodeOut[7],  RegWrite);
	and(andOut[8],  decodeOut[8],  RegWrite);
	and(andOut[9],  decodeOut[9],  RegWrite);
	and(andOut[10], decodeOut[10], RegWrite);
	and(andOut[11], decodeOut[11], RegWrite);
	and(andOut[12], decodeOut[12], RegWrite);
	and(andOut[13], decodeOut[13], RegWrite);
	and(andOut[14], decodeOut[14], RegWrite);
	and(andOut[15], decodeOut[15], RegWrite);
	and(andOut[16], decodeOut[16], RegWrite);
	and(andOut[17], decodeOut[17], RegWrite);
	and(andOut[18], decodeOut[18], RegWrite);
	and(andOut[19], decodeOut[19], RegWrite);
	and(andOut[20], decodeOut[20], RegWrite);
	and(andOut[21], decodeOut[21], RegWrite);
	and(andOut[22], decodeOut[22], RegWrite);
	and(andOut[23], decodeOut[23], RegWrite);
	and(andOut[24], decodeOut[24], RegWrite);
	and(andOut[25], decodeOut[25], RegWrite);
	and(andOut[26], decodeOut[26], RegWrite);
	and(andOut[27], decodeOut[27], RegWrite);
	and(andOut[28], decodeOut[28], RegWrite);
	and(andOut[29], decodeOut[29], RegWrite);
	and(andOut[30], decodeOut[30], RegWrite);
	and(andOut[31], decodeOut[31], RegWrite);
	
	THTW_BIT_REG ttbreg0  (regOut[0],  WriteData,  andOut[0]);
	THTW_BIT_REG ttbreg1  (regOut[1],  WriteData,  andOut[1]);
	THTW_BIT_REG ttbreg2  (regOut[2],  WriteData,  andOut[2]);
	THTW_BIT_REG ttbreg3  (regOut[3],  WriteData,  andOut[3]);
	THTW_BIT_REG ttbreg4  (regOut[4],  WriteData,  andOut[4]);
	THTW_BIT_REG ttbreg5  (regOut[5],  WriteData,  andOut[5]);
	THTW_BIT_REG ttbreg6  (regOut[6],  WriteData,  andOut[6]);
	THTW_BIT_REG ttbreg7  (regOut[7],  WriteData,  andOut[7]);
	THTW_BIT_REG ttbreg8  (regOut[8],  WriteData,  andOut[8]);
	THTW_BIT_REG ttbreg9  (regOut[9],  WriteData,  andOut[9]);
	THTW_BIT_REG ttbreg10 (regOut[10], WriteData, andOut[10]);
	THTW_BIT_REG ttbreg11 (regOut[11], WriteData, andOut[11]);
	THTW_BIT_REG ttbreg12 (regOut[12], WriteData, andOut[12]);
	THTW_BIT_REG ttbreg13 (regOut[13], WriteData, andOut[13]);
	THTW_BIT_REG ttbreg14 (regOut[14], WriteData, andOut[14]);
	THTW_BIT_REG ttbreg15 (regOut[15], WriteData, andOut[15]);
	THTW_BIT_REG ttbreg16 (regOut[16], WriteData, andOut[16]);
	THTW_BIT_REG ttbreg17 (regOut[17], WriteData, andOut[17]);
	THTW_BIT_REG ttbreg18 (regOut[18], WriteData, andOut[18]);
	THTW_BIT_REG ttbreg19 (regOut[19], WriteData, andOut[19]);
	THTW_BIT_REG ttbreg20 (regOut[20], WriteData, andOut[20]);
	THTW_BIT_REG ttbreg21 (regOut[21], WriteData, andOut[21]);
	THTW_BIT_REG ttbreg22 (regOut[22], WriteData, andOut[22]);
	THTW_BIT_REG ttbreg23 (regOut[23], WriteData, andOut[23]);
	THTW_BIT_REG ttbreg24 (regOut[24], WriteData, andOut[24]);
	THTW_BIT_REG ttbreg25 (regOut[25], WriteData, andOut[25]);
	THTW_BIT_REG ttbreg26 (regOut[26], WriteData, andOut[26]);
	THTW_BIT_REG ttbreg27 (regOut[27], WriteData, andOut[27]);
	THTW_BIT_REG ttbreg28 (regOut[28], WriteData, andOut[28]);
	THTW_BIT_REG ttbreg29 (regOut[29], WriteData, andOut[29]);
	THTW_BIT_REG ttbreg30 (regOut[30], WriteData, andOut[30]);
	THTW_BIT_REG ttbreg31 (regOut[31], WriteData, andOut[31]);
	
	wire [31:0] test1, test2;
	assign test1 = regOut[0];
	assign test2 = regOut[1];
	
	MUX_32 mux0 (ReadData1, regOut[0],  regOut[1],  regOut[2],  regOut[3],  regOut[4],  regOut[5],  regOut[6],  regOut[7],
							regOut[8],  regOut[9],  regOut[10], regOut[11], regOut[12], regOut[13], regOut[14], regOut[15], 
							regOut[16], regOut[17], regOut[18], regOut[19], regOut[20], regOut[21], regOut[22], regOut[23],
							regOut[24], regOut[25], regOut[26], regOut[27], regOut[28], regOut[29], regOut[30], regOut[31],
							ReadRegNum1[4], ReadRegNum1[3], ReadRegNum1[2], ReadRegNum1[1], ReadRegNum1[0]);
							
	MUX_32 mux1 (ReadData2, regOut[0],  regOut[1],  regOut[2],  regOut[3],  regOut[4],  regOut[5],  regOut[6],  regOut[7],
							regOut[8],  regOut[9],  regOut[10], regOut[11], regOut[12], regOut[13], regOut[14], regOut[15], 
							regOut[16], regOut[17], regOut[18], regOut[19], regOut[20], regOut[21], regOut[22], regOut[23],
							regOut[24], regOut[25], regOut[26], regOut[27], regOut[28], regOut[29], regOut[30], regOut[31],
							ReadRegNum2[4], ReadRegNum2[3], ReadRegNum2[2], ReadRegNum2[1], ReadRegNum2[0]);
	
endmodule

module THTW_BIT_REG (ReadData, WriteData, Clk);
	output [31:0] ReadData;
	input [31:0] WriteData;
	input Clk;
	
	D_FF dff0  (ReadData[0],  WriteData[0],  Clk);
	D_FF dff1  (ReadData[1],  WriteData[1],  Clk);
	D_FF dff2  (ReadData[2],  WriteData[2],  Clk);
	D_FF dff3  (ReadData[3],  WriteData[3],  Clk);
	D_FF dff4  (ReadData[4],  WriteData[4],  Clk);
	D_FF dff5  (ReadData[5],  WriteData[5],  Clk);
	D_FF dff6  (ReadData[6],  WriteData[6],  Clk);
	D_FF dff7  (ReadData[7],  WriteData[7],  Clk);
	D_FF dff8  (ReadData[8],  WriteData[8],  Clk);
	D_FF dff9  (ReadData[9],  WriteData[9],  Clk);
	D_FF dff10 (ReadData[10], WriteData[10], Clk);
	D_FF dff11 (ReadData[11], WriteData[11], Clk);
	D_FF dff12 (ReadData[12], WriteData[12], Clk);
	D_FF dff13 (ReadData[13], WriteData[13], Clk);
	D_FF dff14 (ReadData[14], WriteData[14], Clk);
	D_FF dff15 (ReadData[15], WriteData[15], Clk);
	D_FF dff16 (ReadData[16], WriteData[16], Clk);
	D_FF dff17 (ReadData[17], WriteData[17], Clk);
	D_FF dff18 (ReadData[18], WriteData[18], Clk);
	D_FF dff19 (ReadData[19], WriteData[19], Clk);
	D_FF dff20 (ReadData[20], WriteData[20], Clk);
	D_FF dff21 (ReadData[21], WriteData[21], Clk);
	D_FF dff22 (ReadData[22], WriteData[22], Clk);
	D_FF dff23 (ReadData[23], WriteData[23], Clk);
	D_FF dff24 (ReadData[24], WriteData[24], Clk);
	D_FF dff25 (ReadData[25], WriteData[25], Clk);
	D_FF dff26 (ReadData[26], WriteData[26], Clk);
	D_FF dff27 (ReadData[27], WriteData[27], Clk);
	D_FF dff28 (ReadData[28], WriteData[28], Clk);
	D_FF dff29 (ReadData[29], WriteData[29], Clk);
	D_FF dff30 (ReadData[30], WriteData[30], Clk);
	D_FF dff31 (ReadData[31], WriteData[31], Clk);	
endmodule

module D_FF (Q, D, Clk);
	output Q;
	input Clk, D;
	
	wire qm, invClk;
	not(invClk, Clk);
	D_LATCH dlatch0 (qm, D, invClk);
	D_LATCH dlatch1 (Q, qm, Clk);
endmodule

module D_LATCH (Q, D, Clk);
	input Clk, D;
	output Q;
	
	wire invD, invQ;
	not(invD, D);
	wire o1, o2;
	nand(o1, D, Clk), (o2, invD, Clk);
	nand(Q, o1, invQ);
	nand(invQ, o2, Q);	
endmodule

module DECODER_32 (Out, S1, S2, S3, S4, S5);
	output [31:0] Out;	
	input S1, S2, S3, S4, S5;

	wire n1, n2, n3, n4, n5;

	not(n1, S1), (n2, S2), (n3, S3), (n4, S4), (n5, S5);	
	and(Out[0],  n1, n2, n3, n4, n5);
	and(Out[1],  n1, n2, n3, n4, S5);
	and(Out[2],  n1, n2, n3, S4, n5);
	and(Out[3],  n1, n2, n3, S4, S5);
	and(Out[4],  n1, n2, S3, n4, n5);
	and(Out[5],  n1, n2, S3, n4, S5);
	and(Out[6],  n1, n2, S3, S4, n5);
	and(Out[7],  n1, n2, S3, S4, S5);
	and(Out[8],  n1, S2, n3, n4, n5);
	and(Out[9],  n1, S2, n3, n4, S5);
	and(Out[10], n1, S2, n3, S4, n5);
	and(Out[11], n1, S2, n3, S4, S5);
	and(Out[12], n1, S2, S3, n4, n5);
	and(Out[13], n1, S2, S3, n4, S5);
	and(Out[14], n1, S2, S3, S4, n5);
	and(Out[15], n1, S2, S3, S4, S5);
	and(Out[16], S1, n2, n3, n4, n5);
	and(Out[17], S1, n2, n3, n4, S5);
	and(Out[18], S1, n2, n3, S4, n5);
	and(Out[19], S1, n2, n3, S4, S5);
	and(Out[20], S1, n2, S3, n4, n5);
	and(Out[21], S1, n2, S3, n4, S5);
	and(Out[22], S1, n2, S3, S4, n5);
	and(Out[23], S1, n2, S3, S4, S5);
	and(Out[24], S1, S2, n3, n4, n5);
	and(Out[25], S1, S2, n3, n4, S5);
	and(Out[26], S1, S2, n3, S4, n5);
	and(Out[27], S1, S2, n3, S4, S5);
	and(Out[28], S1, S2, S3, n4, n5);
	and(Out[29], S1, S2, S3, n4, S5);
	and(Out[30], S1, S2, S3, S4, n5);
	and(Out[31], S1, S2, S3, S4, S5);
endmodule

module MUX_32 (Out, In0,  In1,  In2,  In3,  In4,  In5,  In6,  In7,
			 	    In8,  In9,  In10, In11, In12, In13, In14, In15, 
			 	    In16, In17, In18, In19, In20, In21, In22, In23,
			 	    In24, In25, In26, In27, In28, In29, In30, In31,
			 	    S1, S2, S3, S4, S5);

	output [31:0] Out;
	input [31:0] In0,  In1,  In2,  In3,  In4,  In5,  In6,  In7,
		         In8,  In9,  In10, In11, In12, In13, In14, In15, 
		         In16, In17, In18, In19, In20, In21, In22, In23,
		         In24, In25, In26, In27, In28, In29, In30, In31;
	input S1, S2, S3, S4, S5;

	wire And [31:0];
	wire n1, n2, n3, n4, n5;

	not(n1, S1), (n2, S2), (n3, S3), (n4, S4), (n5, S5);
	
	and(And[0],  n1, n2, n3, n4, n5);
	and(And[1],  n1, n2, n3, n4, S5);
	and(And[2],  n1, n2, n3, S4, n5);
	and(And[3],  n1, n2, n3, S4, S5);
	and(And[4],  n1, n2, S3, n4, n5);
	and(And[5],  n1, n2, S3, n4, S5);
	and(And[6],  n1, n2, S3, S4, n5);
	and(And[7],  n1, n2, S3, S4, S5);
	and(And[8],  n1, S2, n3, n4, n5);
	and(And[9],  n1, S2, n3, n4, S5);
	and(And[10], n1, S2, n3, S4, n5);
	and(And[11], n1, S2, n3, S4, S5);
	and(And[12], n1, S2, S3, n4, n5);
	and(And[13], n1, S2, S3, n4, S5);
	and(And[14], n1, S2, S3, S4, n5);
	and(And[15], n1, S2, S3, S4, S5);
	and(And[16], S1, n2, n3, n4, n5);
	and(And[17], S1, n2, n3, n4, S5);
	and(And[18], S1, n2, n3, S4, n5);
	and(And[19], S1, n2, n3, S4, S5);
	and(And[20], S1, n2, S3, n4, n5);
	and(And[21], S1, n2, S3, n4, S5);
	and(And[22], S1, n2, S3, S4, n5);
	and(And[23], S1, n2, S3, S4, S5);
	and(And[24], S1, S2, n3, n4, n5);
	and(And[25], S1, S2, n3, n4, S5);
	and(And[26], S1, S2, n3, S4, n5);
	and(And[27], S1, S2, n3, S4, S5);
	and(And[28], S1, S2, S3, n4, n5);
	and(And[29], S1, S2, S3, n4, S5);
	and(And[30], S1, S2, S3, S4, n5);
	and(And[31], S1, S2, S3, S4, S5);

	BUFFER_32 buff0  (Out, In0,   And[0]);
	BUFFER_32 buff1  (Out, In1,   And[1]);
	BUFFER_32 buff2  (Out, In2,   And[2]);
	BUFFER_32 buff3  (Out, In3,   And[3]);
	BUFFER_32 buff4  (Out, In4,   And[4]);
	BUFFER_32 buff5  (Out, In5,   And[5]);
	BUFFER_32 buff6  (Out, In6,   And[6]);
	BUFFER_32 buff7  (Out, In7,   And[7]);
	BUFFER_32 buff8  (Out, In8,   And[8]);
	BUFFER_32 buff9  (Out, In9,   And[9]);
	BUFFER_32 buff10 (Out, In10, And[10]);
	BUFFER_32 buff11 (Out, In11, And[11]);
	BUFFER_32 buff12 (Out, In12, And[12]);
	BUFFER_32 buff13 (Out, In13, And[13]);
	BUFFER_32 buff14 (Out, In14, And[14]);
	BUFFER_32 buff15 (Out, In15, And[15]);
	BUFFER_32 buff16 (Out, In16, And[16]);
	BUFFER_32 buff17 (Out, In17, And[17]);
	BUFFER_32 buff18 (Out, In18, And[18]);
	BUFFER_32 buff19 (Out, In19, And[19]);
	BUFFER_32 buff20 (Out, In20, And[20]);
	BUFFER_32 buff21 (Out, In21, And[21]);
	BUFFER_32 buff22 (Out, In22, And[22]);
	BUFFER_32 buff23 (Out, In23, And[23]);
	BUFFER_32 buff24 (Out, In24, And[24]);
	BUFFER_32 buff25 (Out, In25, And[25]);
	BUFFER_32 buff26 (Out, In26, And[26]);
	BUFFER_32 buff27 (Out, In27, And[27]);
	BUFFER_32 buff28 (Out, In28, And[28]);
	BUFFER_32 buff29 (Out, In29, And[29]);
	BUFFER_32 buff30 (Out, In30, And[30]);
	BUFFER_32 buff31 (Out, In31, And[30]);
endmodule

module BUFFER_32 (Out, In, Ctrl);
	output [31:0] Out;
	input [31:0] In;
	input Ctrl;
	
	bufif1(Out[0],  In[0],  Ctrl);
	bufif1(Out[1],  In[1],  Ctrl);
	bufif1(Out[2],  In[2],  Ctrl);
	bufif1(Out[3],  In[3],  Ctrl);
	bufif1(Out[4],  In[4],  Ctrl);
	bufif1(Out[5],  In[5],  Ctrl);
	bufif1(Out[6],  In[6],  Ctrl);
	bufif1(Out[7],  In[7],  Ctrl);
	bufif1(Out[8],  In[8],  Ctrl);
	bufif1(Out[9],  In[9],  Ctrl);
	bufif1(Out[10], In[10], Ctrl);
	bufif1(Out[11], In[11], Ctrl);
	bufif1(Out[12], In[12], Ctrl);
	bufif1(Out[13], In[13], Ctrl);
	bufif1(Out[14], In[14], Ctrl);
	bufif1(Out[15], In[15], Ctrl);
	bufif1(Out[16], In[16], Ctrl);
	bufif1(Out[17], In[17], Ctrl);
	bufif1(Out[18], In[18], Ctrl);
	bufif1(Out[19], In[19], Ctrl);
	bufif1(Out[20], In[20], Ctrl);
	bufif1(Out[21], In[21], Ctrl);
	bufif1(Out[22], In[22], Ctrl);
	bufif1(Out[23], In[23], Ctrl);
	bufif1(Out[24], In[24], Ctrl);
	bufif1(Out[25], In[25], Ctrl);
	bufif1(Out[26], In[26], Ctrl);
	bufif1(Out[27], In[27], Ctrl);
	bufif1(Out[28], In[28], Ctrl);
	bufif1(Out[29], In[29], Ctrl);
	bufif1(Out[30], In[30], Ctrl);
	bufif1(Out[31], In[31], Ctrl);
endmodule




