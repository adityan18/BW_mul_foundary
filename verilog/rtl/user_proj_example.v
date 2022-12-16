
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 23.04.2022 15:20:52
// Design Name:
// Module Name: bw_mul
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module user_proj_example(
    input signed [7:0]a, // 8 bit input
    input signed [7:0]b, // 8 bit input
    output signed [7:0]p // 16 bit product
);


    wire signed [(8 - 2)*2+1:0]sg; // sum out gray cell
    wire signed [(8 - 2)*2+1:0]cg; // carry out gray cell

    wire signed [(8-1)*(8-1)+1:0]sw; // sum out white cell
    wire signed [(8-1)*(8-1)+1:0]cw; // carry out white cell

    wire signed [8 - 1:0]fs; // full adder sum
    wire signed [8 - 1:0]fc; // full adder carry

	carry_adder w0 (a[0], b[0], 0, 0, cw[0]);
	white w1 (a[1], b[0], 0, 0, sw[1], cw[1]);
	white w2 (a[2], b[0], 0, 0, sw[2], cw[2]);
	white w3 (a[3], b[0], 0, 0, sw[3], cw[3]);
	white w4 (a[4], b[0], 0, 0, sw[4], cw[4]);
	white w5 (a[5], b[0], 0, 0, sw[5], cw[5]);
	white w6 (a[6], b[0], 0, 0, sw[6], cw[6]);

	carry_adder w7 (a[0], b[1], cw[0], sw[1], cw[7]);
	white w8 (a[1], b[1], cw[1], sw[2], sw[8], cw[8]);
	white w9 (a[2], b[1], cw[2], sw[3], sw[9], cw[9]);
	white w10 (a[3], b[1], cw[3], sw[4], sw[10], cw[10]);
	white w11 (a[4], b[1], cw[4], sw[5], sw[11], cw[11]);
	white w12 (a[5], b[1], cw[5], sw[6], sw[12], cw[12]);
	white w13 (a[6], b[1], cw[6], sg[0], sw[13], cw[13]);
	carry_adder w14 (a[0], b[2], cw[7], sw[8], cw[14]);
	white w15 (a[1], b[2], cw[8], sw[9], sw[15], cw[15]);
	white w16 (a[2], b[2], cw[9], sw[10], sw[16], cw[16]);
	white w17 (a[3], b[2], cw[10], sw[11], sw[17], cw[17]);
	white w18 (a[4], b[2], cw[11], sw[12], sw[18], cw[18]);
	white w19 (a[5], b[2], cw[12], sw[13], sw[19], cw[19]);
	white w20 (a[6], b[2], cw[13], sg[1], sw[20], cw[20]);
	carry_adder w21 (a[0], b[3], cw[14], sw[15], cw[21]);
	white w22 (a[1], b[3], cw[15], sw[16], sw[22], cw[22]);
	white w23 (a[2], b[3], cw[16], sw[17], sw[23], cw[23]);
	white w24 (a[3], b[3], cw[17], sw[18], sw[24], cw[24]);
	white w25 (a[4], b[3], cw[18], sw[19], sw[25], cw[25]);
	white w26 (a[5], b[3], cw[19], sw[20], sw[26], cw[26]);
	white w27 (a[6], b[3], cw[20], sg[2], sw[27], cw[27]);
	carry_adder w28 (a[0], b[4], cw[21], sw[22], cw[28]);
	white w29 (a[1], b[4], cw[22], sw[23], sw[29], cw[29]);
	white w30 (a[2], b[4], cw[23], sw[24], sw[30], cw[30]);
	white w31 (a[3], b[4], cw[24], sw[25], sw[31], cw[31]);
	white w32 (a[4], b[4], cw[25], sw[26], sw[32], cw[32]);
	white w33 (a[5], b[4], cw[26], sw[27], sw[33], cw[33]);
	white w34 (a[6], b[4], cw[27], sg[3], sw[34], cw[34]);
	white w35 (a[0], b[5], cw[28], sw[29], sw[35], cw[35]);
	white w36 (a[1], b[5], cw[29], sw[30], sw[36], cw[36]);
	white w37 (a[2], b[5], cw[30], sw[31], sw[37], cw[37]);
	white w38 (a[3], b[5], cw[31], sw[32], sw[38], cw[38]);
	white w39 (a[4], b[5], cw[32], sw[33], sw[39], cw[39]);
	white w40 (a[5], b[5], cw[33], sw[34], sw[40], cw[40]);
	white w41 (a[6], b[5], cw[34], sg[4], sw[41], cw[41]);
	white w42 (a[0], b[6], cw[35], sw[36], sw[42], cw[42]);
	white w43 (a[1], b[6], cw[36], sw[37], sw[43], cw[43]);
	white w44 (a[2], b[6], cw[37], sw[38], sw[44], cw[44]);
	white w45 (a[3], b[6], cw[38], sw[39], sw[45], cw[45]);
	white w46 (a[4], b[6], cw[39], sw[40], sw[46], cw[46]);
	white w47 (a[5], b[6], cw[40], sw[41], sw[47], cw[47]);
	sum_adder_white w48 (a[6], b[6], cw[41], sg[5], sw[48]);

	gray g0 (a[7], b[0], 0, 0, sg[0], cg[0]);
	gray g1 (a[7], b[1], 0, cg[0], sg[1], cg[1]);
	gray g2 (a[7], b[2], 0, cg[1], sg[2], cg[2]);
	gray g3 (a[7], b[3], 0, cg[2], sg[3], cg[3]);
	gray g4 (a[7], b[4], 0, cg[3], sg[4], cg[4]);
	sum_adder_gray  g5 (a[7], b[5], 0, cg[4], cg[5]);

	gray g7 (a[0], b[7], cw[42], sw[43], sg[7], cg[7]);
	gray g8 (a[1], b[7], cw[43], sw[44], sg[8], cg[8]);
	gray g9 (a[2], b[7], cw[44], sw[45], sg[9], cg[9]);
	gray g10 (a[3], b[7], cw[45], sw[46], sg[10], cg[10]);
	gray g11 (a[4], b[7], cw[46], sw[47], sg[11], cg[11]);
	sum_adder_gray  g12 (a[5], b[7], cw[47], sw[48], cg[12]);

	fa fa0 (1, cg[7], sg[8], fs[0], fc[0]);
	fa fa1 (fc[0], cg[8], sg[9], fs[1], fc[1]);
	fa fa2 (fc[1], cg[9], sg[10], fs[2], fc[2]);
	fa fa3 (fc[2], cg[10], sg[11], fs[3], fc[3]);
	fa fa4 (fc[3], cg[11], sg[12], fs[4], fc[4]);

	assign p = {fs[4], fs[3], fs[2], fs[1], fs[0], sg[7], sw[42], sw[35]};

endmodule