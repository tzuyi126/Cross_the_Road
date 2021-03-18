//ponyo
//
//
//

`define NM1 32'd466 //bB_freq
`define NM2 32'd523 //C_freq
`define NM3 32'd587 //D_freq
`define NM4 32'd622 //bE_freq
`define NM5 32'd698 //F_freq
`define NM6 32'd784 //G_freq
`define NM7 32'd880 //A_freq
`define NM0 32'd20000 //slience (over freq.)

module Music (
	input [8:0] ibeatNum,	
	output reg [31:0] tone
);

always @(*) begin
	case (ibeatNum)		// 1/4 beat
		9'd0 : tone = `NM0;//5
		9'd1 : tone = `NM5;
		9'd2 : tone = `NM5;
		9'd3 : tone = `NM5;
		9'd4 : tone = `NM3;//3
		9'd5 : tone = `NM3;
		9'd6 : tone = `NM1;//1
		9'd7 : tone = `NM1;
		9'd8 : tone = `NM1;
		9'd9 : tone = `NM1;
		9'd10 : tone = `NM5 >> 1;//5.
		9'd11 : tone = `NM5 >> 1;
		9'd12 : tone = `NM5 >> 1;
		9'd13 : tone = `NM5 >> 1;
		9'd14 : tone = `NM5 >> 1;
		9'd15 : tone = `NM5 >> 1;
	
		9'd16 : tone = `NM6 >> 1;
		9'd17 : tone = `NM6 >> 1;
		9'd18 : tone = `NM1;
		9'd19 : tone = `NM1;
		9'd20 : tone = `NM4;
		9'd21 : tone = `NM4;
		9'd22 : tone = `NM6;
		9'd23 : tone = `NM6;
		9'd24 : tone = `NM5;
		9'd25 : tone = `NM5;
		9'd26 : tone = `NM5;
		9'd27 : tone = `NM5;
		9'd28 : tone = `NM0;
		9'd29 : tone = `NM0;
		9'd30 : tone = `NM3;
		9'd31 : tone = `NM3;
		
		9'd32 : tone = `NM4;
		9'd33 : tone = `NM4;
		9'd34 : tone = `NM2;
		9'd35 : tone = `NM2;
		9'd36 : tone = `NM2;
		9'd37 : tone = `NM2;
		9'd38 : tone = `NM4;
		9'd39 : tone = `NM4;
		9'd40 : tone = `NM3;
		9'd41 : tone = `NM3;
		9'd42 : tone = `NM1;
		9'd43 : tone = `NM1;
		9'd44 : tone = `NM1;
		9'd45 : tone = `NM1;
		9'd46 : tone = `NM3;
		9'd47 : tone = `NM3;
	     
		9'd48 : tone = `NM2;
		9'd49 : tone = `NM2;
		9'd50 : tone = `NM6 >> 1;
		9'd51 : tone = `NM6 >> 1;
		9'd52 : tone = `NM7 >> 1;
		9'd53 : tone = `NM7 >> 1;
		9'd54 : tone = `NM1;
		9'd55 : tone = `NM1;
		9'd56 : tone = `NM2;
		9'd57 : tone = `NM2;
		9'd58 : tone = `NM0;
		9'd59 : tone = `NM0;
		9'd60 : tone = `NM0;
		9'd61 : tone = `NM0;
		9'd62 : tone = `NM0;
		9'd63 : tone = `NM0;
	
		9'd64 : tone = `NM0;//5
		9'd65 : tone = `NM5;
		9'd66 : tone = `NM5;
		9'd67 : tone = `NM5;
		9'd68 : tone = `NM3;//3
		9'd69 : tone = `NM3;
		9'd70 : tone = `NM1;//1
		9'd71 : tone = `NM1;
		9'd72 : tone = `NM1;
		9'd73 : tone = `NM1;
		9'd74 : tone = `NM5 >> 1;//5.
		9'd75 : tone = `NM5 >> 1;
		9'd76 : tone = `NM5 >> 1;
		9'd77 : tone = `NM5 >> 1;
		9'd78 : tone = `NM5 >> 1;
		9'd79 : tone = `NM5 >> 1;
	
		9'd80 : tone = `NM6 >> 1;
		9'd81 : tone = `NM6 >> 1;
		9'd82 : tone = `NM1;
		9'd83 : tone = `NM1;
		9'd84 : tone = `NM4;
		9'd85 : tone = `NM4;
		9'd86 : tone = `NM6;
		9'd87 : tone = `NM6;
		9'd88 : tone = `NM5;
		9'd89 : tone = `NM5;
		9'd90 : tone = `NM5;
		9'd91 : tone = `NM5;
		9'd92 : tone = `NM0;
		9'd93 : tone = `NM0;
		9'd94 : tone = `NM3;
		9'd95 : tone = `NM3;
	
		9'd96 : tone = `NM4;
		9'd97 : tone = `NM4;
		9'd98 : tone = `NM2;
		9'd99 : tone = `NM2;
		9'd100 : tone = `NM2;
		9'd101 : tone = `NM2;
		9'd102 : tone = `NM4;
		9'd103 : tone = `NM4;
		9'd104 : tone = `NM3;
		9'd105 : tone = `NM3;
		9'd106 : tone = `NM1;
		9'd107 : tone = `NM1;
		9'd108 : tone = `NM1;
		9'd109 : tone = `NM1;
		9'd110 : tone = `NM3;
		9'd111 : tone = `NM3;
	
		9'd112 : tone = `NM2;
		9'd113 : tone = `NM2;
		9'd114 : tone = `NM7 >> 1;
		9'd115 : tone = `NM7 >> 1;
		9'd116 : tone = `NM7 >> 1;
		9'd117 : tone = `NM7 >> 1;
		9'd118 : tone = `NM1;
		9'd119 : tone = `NM1;
		9'd120 : tone = `NM0;
		9'd121 : tone = `NM0;
		9'd122 : tone = `NM0;
		9'd123 : tone = `NM0;
		9'd124 : tone = `NM0;
		9'd125 : tone = `NM0;
		9'd126 : tone = `NM0;
		9'd127 : tone = `NM0;
		
		//pada pada
		9'd128 : tone = `NM1;
		9'd129 : tone = `NM1;
		9'd130 : tone = `NM1;
		9'd131 : tone = `NM1;
		9'd132 : tone = `NM5 >> 1;
		9'd133 : tone = `NM5 >> 1;
		9'd134 : tone = `NM1;
		9'd135 : tone = `NM1;
		9'd136 : tone = `NM2;
		9'd137 : tone = `NM2;
		9'd138 : tone = `NM2;
		9'd139 : tone = `NM2;
		9'd140 : tone = `NM0;
		9'd141 : tone = `NM0;
		9'd142 : tone = `NM0;
		9'd143 : tone = `NM0;
		
		9'd144 : tone = `NM2;
		9'd145 : tone = `NM2;
		9'd146 : tone = `NM2;
		9'd147 : tone = `NM2;
		9'd148 : tone = `NM5 >> 1;
		9'd149 : tone = `NM5 >> 1;
		9'd150 : tone = `NM2;
		9'd151 : tone = `NM2;
		9'd152 : tone = `NM3;
		9'd153 : tone = `NM3;
		9'd154 : tone = `NM3;
		9'd155 : tone = `NM3;
		9'd156 : tone = `NM0;
		9'd157 : tone = `NM0;
		9'd158 : tone = `NM0;
		9'd159 : tone = `NM0;
		
		9'd160 : tone = `NM3;
		9'd161 : tone = `NM3;
		9'd162 : tone = `NM1;
		9'd163 : tone = `NM1;
		9'd164 : tone = `NM1;
		9'd165 : tone = `NM1;
		9'd166 : tone = `NM3;
		9'd167 : tone = `NM3;
		9'd168 : tone = `NM4;
		9'd169 : tone = `NM4;
		9'd170 : tone = `NM5;
		9'd171 : tone = `NM5;
		9'd172 : tone = `NM6;
		9'd173 : tone = `NM6;
		9'd174 : tone = `NM6;
		9'd175 : tone = `NM6;
	
		9'd176 : tone = `NM5;
		9'd177 : tone = `NM5;
		9'd178 : tone = `NM3;
		9'd179 : tone = `NM3;
		9'd180 : tone = `NM3;
		9'd181 : tone = `NM3;
		9'd182 : tone = `NM1;
		9'd183 : tone = `NM1;
		9'd184 : tone = `NM2;
		9'd185 : tone = `NM2;
		9'd186 : tone = `NM2;
		9'd187 : tone = `NM2;
		9'd188 : tone = `NM0;
		9'd189 : tone = `NM0;
		9'd190 : tone = `NM0;
		9'd191 : tone = `NM0;
	
		9'd192 : tone = `NM1;
		9'd193 : tone = `NM1;
		9'd194 : tone = `NM1;
		9'd195 : tone = `NM1;
		9'd196 : tone = `NM5 >> 1;
		9'd197 : tone = `NM5 >> 1;
		9'd198 : tone = `NM1;
		9'd199 : tone = `NM1;
		9'd200 : tone = `NM2;
		9'd201 : tone = `NM2;
		9'd202 : tone = `NM2;
		9'd203 : tone = `NM2;
		9'd204 : tone = `NM0;
		9'd205 : tone = `NM0;
		9'd206 : tone = `NM0;
		9'd207 : tone = `NM0;
		
		9'd208 : tone = `NM2;
		9'd209 : tone = `NM2;
		9'd210 : tone = `NM2;
		9'd211 : tone = `NM2;
		9'd212 : tone = `NM5 >> 1;
		9'd213 : tone = `NM5 >> 1;
		9'd214 : tone = `NM2;
		9'd215 : tone = `NM2;
		9'd216 : tone = `NM3;
		9'd217 : tone = `NM3;
		9'd218 : tone = `NM3;
		9'd219 : tone = `NM3;
		9'd220 : tone = `NM0;
		9'd221 : tone = `NM0;
		9'd222 : tone = `NM0;
		9'd223 : tone = `NM0;
		
		9'd224 : tone = `NM3;
		9'd225 : tone = `NM3;
		9'd226 : tone = `NM1;
		9'd227 : tone = `NM1;
		9'd228 : tone = `NM1;
		9'd229 : tone = `NM1;
		9'd230 : tone = `NM3;
		9'd231 : tone = `NM3;
		9'd232 : tone = `NM4;
		9'd233 : tone = `NM4;
		9'd234 : tone = `NM5;
		9'd235 : tone = `NM5;
		9'd236 : tone = `NM6;
		9'd237 : tone = `NM6;
		9'd238 : tone = `NM6;
		9'd239 : tone = `NM6;
		
		9'd240 : tone = `NM5;
		9'd241 : tone = `NM5;
		9'd242 : tone = `NM3;
		9'd243 : tone = `NM3;
		9'd244 : tone = `NM0;
		9'd245 : tone = `NM0;
		9'd246 : tone = `NM5 >> 1;
		9'd247 : tone = `NM5 >> 1;
		9'd248 : tone = `NM1;
		9'd249 : tone = `NM1;
		9'd250 : tone = `NM1;
		9'd251 : tone = `NM1;
		9'd252 : tone = `NM0;
		9'd253 : tone = `NM0;
		9'd254 : tone = `NM0;
		9'd255 : tone = `NM0;
		
		9'd256 : tone = `NM0;
		9'd257 : tone = `NM0;
		9'd258 : tone = `NM2;
		9'd259 : tone = `NM2;
		9'd260 : tone = `NM2;
		9'd261 : tone = `NM2;
		9'd262 : tone = `NM2;
		9'd263 : tone = `NM2;
		9'd264 : tone = `NM2;
		9'd265 : tone = `NM2;
		9'd266 : tone = `NM2;
		9'd267 : tone = `NM2;
		9'd268 : tone = `NM1;
		9'd269 : tone = `NM1;
		9'd270 : tone = `NM2;
		9'd271 : tone = `NM2;
	
		9'd272 : tone = `NM3;
		9'd273 : tone = `NM3;
		9'd274 : tone = `NM3;
		9'd275 : tone = `NM3;
		9'd276 : tone = `NM0;
		9'd277 : tone = `NM0;
		9'd278 : tone = `NM0;
		9'd279 : tone = `NM0;
		9'd280 : tone = `NM5;
		9'd281 : tone = `NM5;
		9'd282 : tone = `NM5;
		9'd283 : tone = `NM5;
		9'd284 : tone = `NM0;
		9'd285 : tone = `NM0;
		9'd286 : tone = `NM0;
		9'd287 : tone = `NM0;

		9'd288 : tone = `NM0;
		9'd289 : tone = `NM0;
		9'd290 : tone = `NM2;
		9'd291 : tone = `NM2;
		9'd292 : tone = `NM2;
		9'd293 : tone = `NM2;
		9'd294 : tone = `NM3;
		9'd295 : tone = `NM3;
		9'd296 : tone = `NM2;
		9'd297 : tone = `NM2;
		9'd298 : tone = `NM1;
		9'd299 : tone = `NM1;
		9'd300 : tone = `NM1;
		9'd301 : tone = `NM1;
		9'd302 : tone = `NM6 >> 1;
		9'd303 : tone = `NM6 >> 1;
		
		9'd304 : tone = `NM5 >> 1;
		9'd305 : tone = `NM5 >> 1;
		9'd306 : tone = `NM5 >> 1;
		9'd307 : tone = `NM5 >> 1;
		9'd308 : tone = `NM3;
		9'd309 : tone = `NM3;
		9'd310 : tone = `NM3;
		9'd311 : tone = `NM3;
		9'd312 : tone = `NM0;
		9'd313 : tone = `NM0;
		9'd314 : tone = `NM0;
		9'd315 : tone = `NM0;
		9'd316 : tone = `NM0;
		9'd317 : tone = `NM0;
		9'd318 : tone = `NM0;
		9'd319 : tone = `NM0;
		
		9'd320 : tone = `NM1;
		9'd321 : tone = `NM1;
		9'd322 : tone = `NM0;
		9'd323 : tone = `NM1;
		9'd324 : tone = `NM5 >> 1;
		9'd325 : tone = `NM5 >> 1;
		9'd326 : tone = `NM1;
		9'd327 : tone = `NM1;
		9'd328 : tone = `NM6;
		9'd329 : tone = `NM6;
		9'd330 : tone = `NM5;
		9'd331 : tone = `NM5;
		9'd332 : tone = `NM0;
		9'd333 : tone = `NM0;
		9'd334 : tone = `NM0;
		9'd335 : tone = `NM0;
		
		9'd336 : tone = `NM6 >> 1;
		9'd337 : tone = `NM6 >> 1;
		9'd338 : tone = `NM0 >> 1;
		9'd339 : tone = `NM6 >> 1;
		9'd340 : tone = `NM6 >> 1;
		9'd341 : tone = `NM6 >> 1;
		9'd342 : tone = `NM1 >> 1;
		9'd343 : tone = `NM1 >> 1;
		9'd344 : tone = `NM5;
		9'd345 : tone = `NM5;
		9'd346 : tone = `NM3;
		9'd347 : tone = `NM3;
		9'd348 : tone = `NM0;
		9'd349 : tone = `NM0;
		9'd350 : tone = `NM0;
		9'd351 : tone = `NM0;
		
		9'd352 : tone = `NM0;
		9'd353 : tone = `NM0;
		9'd354 : tone = `NM0;
		9'd355 : tone = `NM0;
		9'd356 : tone = `NM3;
		9'd357 : tone = `NM3;
		9'd358 : tone = `NM3;
		9'd359 : tone = `NM3;
		9'd360 : tone = `NM4;
		9'd361 : tone = `NM4;
		9'd362 : tone = `NM4;
		9'd363 : tone = `NM4;
		9'd364 : tone = `NM5;
		9'd365 : tone = `NM5;
		9'd366 : tone = `NM5;
		9'd367 : tone = `NM5;
		
		9'd368 : tone = `NM1;
		9'd369 : tone = `NM1;
		9'd370 : tone = `NM1;
		9'd371 : tone = `NM1;
		9'd372 : tone = `NM1;
		9'd373 : tone = `NM1;
		9'd374 : tone = `NM1;
		9'd375 : tone = `NM1;
		9'd376 : tone = `NM2;
		9'd377 : tone = `NM2;
		9'd378 : tone = `NM2;
		9'd379 : tone = `NM2;
		9'd380 : tone = `NM3;
		9'd381 : tone = `NM3;
		9'd382 : tone = `NM3;
		9'd383 : tone = `NM3;
	
		9'd384 : tone = `NM2;
		9'd385 : tone = `NM2;
		9'd386 : tone = `NM2;
		9'd387 : tone = `NM2;
		9'd388 : tone = `NM0;
		9'd389 : tone = `NM0;
		9'd390 : tone = `NM0;
		9'd391 : tone = `NM0;
		9'd392 : tone = `NM0;
		9'd393 : tone = `NM0;
		9'd394 : tone = `NM0;
		9'd395 : tone = `NM0;
		9'd396 : tone = `NM0;
		9'd397 : tone = `NM0;
		9'd398 : tone = `NM0;
		9'd399 : tone = `NM0;
	
		9'd400 : tone = `NM5 >> 1;
		9'd401 : tone = `NM5 >> 1;
		9'd402 : tone = `NM1;
		9'd403 : tone = `NM1;
		9'd404 : tone = `NM1;
		9'd405 : tone = `NM1;
		9'd406 : tone = `NM2;
		9'd407 : tone = `NM2;
		9'd408 : tone = `NM2;
		9'd409 : tone = `NM2;
		9'd410 : tone = `NM3;
		9'd411 : tone = `NM3;
		9'd412 : tone = `NM3;
		9'd413 : tone = `NM3;
		9'd414 : tone = `NM4;
		9'd415 : tone = `NM4;

		default : tone = `NM0;
	endcase
end

endmodule