`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:37:11 09/10/2021 
// Design Name: 
// Module Name:    PLAster128 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module PLAster128(
	 input rw,				// 1
	 input aec,				// 2
	 input game,			// 4
	 input xrom,			// 6
	 input z8en,			// 7
	 input z8io,			// 8
	 input ms3,				// 9
	 input ms2,				// 10
	 input ms1,				// 11
	 input ms0,				// 12
	 input vma4,			// 13
	 input clk,				// 15
	 input vicfix,			// 16
	 input vma5,			// 17
	 input ba,				// 18
	 input lram,			// 19
	 input hram,			// 20
	 input chre,			// 22
	 input va14,			// 23
	 input r256,			// 24
	 //output sden,		// 25
	 output roml,			// 27
	 output romh,			// 31
	 output clrbnk,		// 32
	 output rom4,			// 33
	 output rom3,			// 34
	 output from,			// 35
	 output rom2,			// 36
	 input eyes,			// 38
	 input knlovr,			// 39
	 input slowxp,			// 40
	 output rom1,			// 43
	 output reg dwe,		// 46
	 //output dir,			// 47
	 output iocs,			// 48
	 output reg casenb,	// 49
	 output vic,			// 50
	 output ioacc,			// 51
	 output gwe,			// 52
	 output colram,		// 56
	 output charom,		// 57
	 input a15,				// 58
	 input a14,				// 59
	 input a13,				// 60
	 input a12,				// 61
	 input a11,				// 62
	 input a10				// 63
	 //input dmaack		// 64
  );

assign knlwillovr64 = !knlovr && !ms3 && aec && rw && a15 && a14 && a13 && hram && (game || !xrom);
assign knlwillovr128 = !knlovr && ms3 && !ms0 && !ms1 && aec && rw && a15 && a14 && (a13 || !a12);
assign from = eyes ? 1'bz : !(!ms0 && ms1 && ms3 && aec && a15 && rw && (!a14 || a13 || !a12 || ms2));
assign rom4 = eyes ? 1'bz : !(!ms0 && !ms1 &&
	((!knlwillovr128 && ms3 && rw && aec && a15 && a14 && (a13 || !a12)) ||
	(z8io && !z8en && rw && aec && !a15 && !a14 && !a13 && !a12)));
assign romh = eyes ? 1'bz : !(knlwillovr64 || (vma5 && vma4 && !ms3 && xrom && !game && !aec) ||
	(aec && a15 && ((!ms3 && a13 && !game && ((xrom && a14) || (!xrom && !a14 && hram && rw))) ||
	((ms0 || knlwillovr128) && !ms1 && ms3 && rw && a14 && (a13 || !a12 || ms2)))));
assign clrbnk = eyes ? 1'bz : !(ms3 && ((aec && !lram) || (!aec && !hram)));
assign roml = eyes ? 1'bz : !(aec && a15 && !a14 && ((!ms3 && !a13 && ((xrom && !game) || (!xrom && hram && lram && rw))) || (
	 ms0 && !ms1 && ms3 && rw)));
assign rom3 = eyes ? 1'bz : !(!knlwillovr128 && aec && !ms0 && !ms1 && ms3 && rw && ((!a14 && a15) || (!r256 && a14 && !a15)));
assign rom2 = eyes ? 1'bz : !(aec && !ms0 && !ms1 && ms3 && rw && a14 && !a15);
assign rom1 = eyes ? 1'bz : (knlwillovr64 || !(aec && rw && ((!ms3 && a15 && a13 && hram && ((!a14 && game && lram) || (a14 && (game || !xrom)))) ||
	(!r256 && !ms0 && !ms1 && ((ms3 && a15 && a14 && (a13 || !a12)) || (z8io && !z8en && !a15 && !a14 && !a13 && !a12))))));
assign iocs = eyes ? 1'bz : !(aec && a15 && a14 && !a13 && a12 && ((((!ms3 &&
	((chre && (lram || hram) && (game || !xrom)) || (xrom && !game))) ||
	(ms3 && !ms2 && z8en)) && (ba || !rw)) || (!z8io && !z8en)));
assign gwe = eyes ? 1'bz : !(aec && !rw && ((a15 && a14 && !a13 && a12 && a11 && !a10) ||
	(!z8en && !ms2 && !a15 && !a14 && !a13 && a12 && !a11 && !a10)));
assign vic = eyes ? 1'bz : !(aec && a15 && a14 && !a13 && a12 && !a11 && !a10 && (((ba || !rw) &&
	((ms3 && !ms2 && z8en) || (!ms3 && ((chre && (hram || lram) && (game || !xrom)) ||
	(xrom && !game))))) || (!z8en && !z8io)));
assign ioacc = eyes ? 1'bz : !(!iocs || !vic || (!slowxp && (!roml || !romh)));
assign colram = eyes ? 1'bz : !(!aec || (!a13 && a12 && !a10 && ((a11 & a14 & a15 && (ba || !rw) &&
	((!ms2 && ms3 && z8en) || (!ms3 && ((chre && (lram || hram) && (game || !xrom)) || (xrom && !game))))) ||
	(!z8en && ((!z8io && a11 && a14 && a15) || (!ms2 && !a11 && !a14 && !a15))))));
assign charom = eyes ? 1'bz : !((!ms3 && aec && !chre && a15 && a14 && !a13 && a12 && rw &&
	((game && (hram || lram)) || (hram && !xrom && !game))) ||
	(!ms3 && !aec && (game || !xrom) && vma4 && !vma5 && va14) ||
	(ms3 && !aec && vma4 && !vma5 && !chre) ||
	(ms3 && aec && (!ms0 && !ms1 && ms2 && z8en && rw && a15 && a14 && !a13 && a12)));

assign dwefill = !(!rw && aec);

always @ (clk or dwefill) begin
	if (clk)
		dwe <= eyes ? 1'bz : dwefill;
end

assign casenbcan = clk || (rw & !aec & vicfix);
assign casenbfill = !iocs || !vic || !charom || !roml || !romh || !from || !rom4 || !rom3 || !rom2 || !rom1 ||
	(aec && !z8en && !a13 && a12 && !a10 && ((!z8io && a11 && a14 && a15) || (!ms2 && !a11 && !a14 && !a15))) ||
	(!ms3 && xrom && !game && aec && (a13 || (!a12 && a14 && a15) || ((a12 || a14) && !a15)));

always @ (casenbcan or casenbfill) begin
	if (casenbcan)
		casenb <= eyes ? 1'bz : casenbfill;		
end

endmodule
