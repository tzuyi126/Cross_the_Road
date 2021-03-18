`timescale 1ns / 1ps

module Top(
    input clk,
    input rst_press,
    output [3:0] vgaRed,
    output [3:0] vgaGreen,
    output [3:0] vgaBlue,
    output hsync,
    output vsync,
    output [6:0] seg,
    output [3:0] AN,
    output dot,
    inout wire PS2_DATA,
    inout wire PS2_CLK,
	output pmod_1,
	output pmod_2,
	output pmod_4,
	output [2:0]led
);

// rst
wire rst_deb,rst;
Debounce deb_rst(.clk(clk), .signal(rst_press), .signal_deb(rst_deb));
OnePulse one_pulse_rst(.signal_one_pulse(rst),.signal(rst_deb),.clock(clk));

wire clk_25MHz;
wire clk_22;
wire clk_20,clk_21,clk_23,clk_17,clk_19;
clock_divisor clk_wiz_0_inst(
	.clk(clk),
	.clk1(clk_25MHz),
	.clk17(clk_17),
	.clk22(clk_22),
	.clk20(clk_20),
	.clk21(clk_21),
	.clk23(clk_23),
	.clk19(clk_19)
);

wire [511:0] key_down;
wire [8:0] last_change;
wire been_ready;
KeyboardDecoder key_de (
    .key_down(key_down),
	.last_change(last_change),
	.key_valid(been_ready),
	.PS2_DATA(PS2_DATA),
	.PS2_CLK(PS2_CLK),
	.rst(rst),
	.clk(clk)
);

parameter [9-1:0] KEY_CODES [0:2] = {
    9'h1D, // w
	9'h1C, // a
	9'h23  // d
};

// control
wire UP,LEFT,RIGHT;
assign UP = (key_down[KEY_CODES [0]] == 1'b1) ? 1'b1 : 1'b0;
assign LEFT = (key_down[KEY_CODES [1]] == 1'b1) ? 1'b1 : 1'b0;
assign RIGHT = (key_down[KEY_CODES [2]] == 1'b1) ? 1'b1 : 1'b0;


// vga
wire [11:0] data;
wire [16:0] pixel_addr;
wire [11:0] pixel0,pixel1,pixel2;
wire valid;
wire [9:0] h_cnt; //640
wire [9:0] v_cnt;  //480

wire [4-1:0] enable;

//player
reg [8:0] player_v;
reg [9:0] player_h;

//cars' begin vertical position
parameter ch11 = 200;
parameter ch12 = 425;
parameter ch21 = 50;
parameter ch22 = 370;
parameter ch31 = 86;
parameter ch32 = 267;
parameter ch33 = 570;
parameter ch41 = 163;
parameter ch42 = 360;
parameter ch43 = 540;
parameter ch51 = 233;
parameter ch52 = 480;
parameter ch61 = 83;
parameter ch62 = 370;
parameter ch63 = 505;
parameter ch71 = 250;
parameter ch72 = 460;
parameter ch81 = 180;
parameter ch82 = 577;

//cars'  begin horizontal position
parameter cv1 = 60;
parameter cv2 = 100;
parameter cv3 = 140;
parameter cv4 = 220;
parameter cv5 = 260;
parameter cv6 = 340;
parameter cv7 = 380;
parameter cv8 = 420;

//moving cars
reg [9:0] car11, car12, car21, car22, car31, car32, car33, car41, car42, car43, car51, car52, car61, car62, car63, car71, car72, car81, car82;

//start
wire start;
assign start = 1;

//car on track 1, 4, 6, 7
always @ (posedge clk_20 or posedge rst) begin
    if(rst) begin
        car11 <= ch11;
        car12 <= ch12;
        car41 <= ch41;
        car42 <= ch42;
        car43 <= ch43;
        car61 <= ch61;
        car62 <= ch62;
        car63 <= ch63;
        car71 <= ch71;
        car72 <= ch72;
    end
    else if(start)begin
    //right
        if(car11 < 640)
            car11 <= car11 + 1;
        else
            car11 <= 0;
        if(car12 < 640)
            car12 <= car12 + 1;
        else
            car12 <= 0;
        if(car41 < 640)
            car41 <= car41 + 1;
        else
            car41 <= 0;
        if(car42 < 640)
            car42 <= car42 + 1;
        else
            car42 <= 0;
        if(car43 < 640)
            car43 <= car43 + 1;
        else
            car43 <= 0;
        if(car61 < 640)
            car61 <= car61 + 1;
        else
            car61 <= 0;
        if(car62 < 640)
            car62 <= car62 + 1;
        else
            car62 <= 0;
        if(car63 < 640)
            car63 <= car63 + 1;
         else
            car63 <= 0;          
    //left       
        if(car71 > 0)
            car71 <= car71 - 1;
        else
            car71 <= 640;
        if(car72 > 0)
            car72 <= car72 - 1;
        else
            car72 <= 640;            
    end
    else begin
        car11 <= car11;
        car12 <= car12;
        car41 <= car41;
        car42 <= car42;
        car43 <= car43;
        car61 <= car61;
        car62 <= car62;
        car63 <= car63;       
        car71 <= car71;
        car72 <= car72;
    end
end

//cars on track 2, 3, 8
always @ (posedge clk_19 or posedge rst) begin
    if(rst) begin
        car21 <= ch21;
        car22 <= ch22;
        car31 <= ch31;
        car32 <= ch32;
        car33 <= ch33;
        car81 <= ch81;
        car82 <= ch82;
    end
    else if(start)begin
		//right
        if(car31 <640)
            car31 <= car31 + 1;
        else
            car31 <= 0;
        if(car32 <640)
            car32 <= car32 + 1;
        else
            car32 <= 0;
        if(car33 <640)
            car33 <= car33 + 1;
        else
            car33 <= 0;   
        if(car81 <640)
            car81 <= car81 + 1;
        else
            car81 <= 0;
        if(car82 <640)
            car82 <= car82 + 1;
        else
            car82 <= 0;  
        //left    
        if(car21 > 0)
            car21 <= car21 - 1;
        else
            car21 <= 640;
        if(car22 > 0)
            car22 <= car22 - 1;
        else
            car22 <= 640;
    end
    else begin
        car21 <= car21;
        car22 <= car22;
        car31 <= car31;
        car32 <= car32;
        car33 <= car33;
        car81 <= car81;
        car82 <= car82;
    end
end

//cars on track 5
always @ (posedge clk_21 or posedge rst) begin
    if(rst) begin
        car51 <= ch51;
        car52 <= ch52;
    end
    else if(start)begin
		//left
        if(car51 > 0)
            car51 <= car51 - 1;
        else
            car51 <= 640;
        if(car52 > 0)
            car52 <= car52 - 1;
        else
            car52 <= 640;
    end
    else begin
        car51 <= car51;
        car52 <= car52;
    end
end

//collide
reg collide;

always@(posedge clk_23 or posedge rst)begin
    if(rst)
        collide <= 0;
    else if(player_v == cv1)begin//when player is on track1
        if((player_h - car11 <= 50) || (car11 - player_h <= 50) || (player_h - car12 <= 50) || (car12 - player_h <= 50))
            collide <= 1;
        else
            collide <= 0;
    end
    else if(player_v == cv2)begin//when player is on track
        if((player_h - car21 <= 50) || (car21 - player_h <= 50) || (player_h - car22 <= 50) || (car22 - player_h <= 50))
            collide <= 1;
        else
            collide <= 0;
    end
    else if(player_v == cv3)begin//when player is on track3
        if((player_h - car31 <= 50) || (car31 - player_h <= 50) || (player_h - car32 <= 50) || (car32 - player_h <= 50) || (player_h - car33 <= 50) || (car33 - player_h <= 50))
            collide <= 1;
        else
            collide <= 0;
    end
    else if(player_v == cv4)begin//when player is on track4
        if((player_h - car41 <= 50) || (car41 - player_h <= 50) || (player_h - car42 <= 50) || (car42 - player_h <= 50) || (player_h - car43 <= 50) || (car43 - player_h <= 50))
            collide <= 1;
        else
            collide <= 0;
    end
    else if(player_v == cv5)begin//when player is on track5
        if((player_h - car51 <= 70) || (car51 - player_h <= 70) || (player_h - car52 <= 70) || (car52 - player_h <= 70))
            collide <= 1;
        else
            collide <= 0;
    end
    else if(player_v == cv6)begin//when player is on track6
        if((player_h - car61 <= 50) || (car61 - player_h <= 50) || (player_h - car62 <= 50) || (car62 - player_h <= 50) || (player_h - car63 <= 50) || (car63 - player_h <= 50) )
            collide <= 1;
        else
            collide <= 0;
    end
    else if(player_v == cv7)begin//when player is on track7
        if((player_h - car71 <= 50) || (car71 - player_h <= 50) || (player_h - car72 <= 50) || (car72 - player_h <= 50))
            collide <= 1;
        else
            collide <= 0;
    end
    else if(player_v == cv8)begin//when player is on track8
        if((player_h - car81 <= 50) || (car81 - player_h <= 50) || (player_h - car82 <= 50) || (car82 - player_h <= 50))
            collide <= 1;
        else
            collide <= 0;
    end
    else 
        collide <= 0;
end

// level
reg l1=0, l2=0, l3=0;
reg finish;

//player position
always@(posedge clk_23 or posedge rst or posedge collide)begin
    if(rst)begin
        player_v <= 460;
        player_h <= 320;
    end
    else if(start) begin
        if(collide)begin
            player_v <= 460;
            player_h <= 320;
        end
        else if(UP)begin
            if(player_v > 0)begin
                if(player_v == 60)begin
                    player_v <= ((player_h == 40 && l1 == 0) || (player_h == 320 && l2 == 0) || (player_h == 600 && l3 == 0)) ? player_v-40: player_v;
                    player_h <= player_h;
                end
                else if(player_v == 20)begin
                    player_v <=  460;
                    player_h <=  320;
                end
                else begin
                    player_h <= player_h;
                    player_v <= player_v-40;
                end
            end
            else begin
                player_v <= player_v;
                player_h <= player_h;
            end
        end
        else if(LEFT)begin
            if(player_v == 20)begin
                player_v <= 460;
                player_h <= 320;
            end
            else begin
                player_v <= player_v;
                player_h <= (player_h > 40)? player_h-40 : player_h;
            end
        end
        else if(RIGHT)begin
            if(player_v == 20)begin
                player_v <= 460;
                player_h <= 320;
            end
            else begin
                player_v <= player_v;
                player_h <= (player_h < 600)? player_h+40 : player_h;
            end
        end
        else begin
            player_v <= player_v;
            player_h <= player_h;
        end
    end
    else begin
        player_v <= player_v;
        player_h <= player_h;
    end
end

//level
always@(posedge clk)begin
    if(rst)begin
        l1 <= 0;
        l2 <= 0;
        l3 <= 0;
    end
    else if(player_v == 20 && player_h == 40)begin
        l1 <= 1;
        l2 <= l2;
        l3 <= l3;
    end
    else if(player_v == 20 && player_h == 320)begin
        l1 <= l1;
        l2 <= 1;
        l3 <= l3;
    end
    else if(player_v == 20 && player_h == 600)begin
        l1 <= l1;
        l2 <= l2;
        l3 <= 1;
    end
    else begin
        l1 = l1;
        l2 = l2;
        l3 = l3;
    end
end

always@(posedge clk)begin
    if(rst)
        finish <= 0;
    else
        finish <= ({l1 ,l2 , l3} == 3'b111 ) ? 1 : 0;
end

//st
reg st;
always@(posedge rst or posedge UP)begin
    if(rst)
        st <= 0;
    else if(st == 0 && UP == 1)
        st <= 1;
    else
        st <= st;
end

//state
wire [1:0]state;
assign state = {finish, st};

//debug
assign led[0] = state[0];
assign led[1] = state[1];
assign led[2] = finish;


	
//4-digit 7-segment display -> stopwatch
stopwatch stop1(.clk(clk), .clk_17(clk_17), .rst(rst), .start(st), .finish(finish), .AN(AN), .seg(seg), .dot(dot));

mem_addr_gen mem_addr_gen_inst(
	.clk_25MHz(clk_25MHz),
	.clk_22(clk_22),
	.clk_20(clk_20),
	.clk_21(clk_21),
	.rst(rst),
	.h_cnt(h_cnt),
	.v_cnt(v_cnt),
	.pixel_addr(pixel_addr),
	.enable(enable),
	.state(state)
);
   

blk_mem_gen_0 blk_mem_gen_0_inst(
    .clka(clk_25MHz),
    .wea(0),
    .addra(pixel_addr),
    .dina(data[11:0]),
    .douta(pixel0)
);

blk_mem_gen_1 blk_mem_gen_1_inst(
    .clka(clk_25MHz),
    .wea(0),
    .addra(pixel_addr),
    .dina(data[11:0]),
    .douta(pixel1)
);

blk_mem_gen_2 blk_mem_gen_2_inst(
    .clka(clk_25MHz),
    .wea(0),
    .addra(pixel_addr),
    .dina(data[11:0]),
    .douta(pixel2)
);

vga_controller  vga_inst(
    .pclk(clk_25MHz),
    .reset(rst),
    .hsync(hsync),
    .vsync(vsync),
    .valid(valid),
    .enable(enable),
    .h_cnt(h_cnt),
    .v_cnt(v_cnt)
);

//assign {vgaRed, vgaGreen, vgaBlue} = (valid==1'b1) ?pixels:12'h0;
pixel_gen pixel_gen_inst(
       .rst(rst),
       .h_cnt(h_cnt),
       .v_cnt(v_cnt),
       .valid(valid),
       .pixel0(pixel0),
       .pixel1(pixel1),
       .pixel2(pixel2),
       .player_v(player_v),
       .player_h(player_h),
       .vgaRed(vgaRed),
       .vgaGreen(vgaGreen),
       .vgaBlue(vgaBlue),
       .l1(l1),
       .l2(l2),
       .l3(l3),
       .state(state)
    );

//background music
parameter BEAT_FREQ = 32'd8;	//one beat=0.125sec
parameter DUTY_BEST = 10'd512;	//duty cycle=50%

wire [31:0] freq;
wire [8:0] ibeatNum;
wire beatFreq;

assign pmod_2 = 1'd1;	//no gain(6dB)
assign pmod_4 = (start == 1 && finish == 0) ? 1'd1 : 1'd0;	//turn-on

//Generate beat speed
PWM_gen btSpeedGen ( .clk(clk), 
					 .rst(rst),
					 .freq(BEAT_FREQ),
					 .duty(DUTY_BEST), 
					 .PWM(beatFreq)
);
	
//manipulate beat
PlayerCtrl playerCtrl_00 ( .clk(beatFreq),
						   .rst(rst),
						   .ibeat(ibeatNum)
);	
	
//Generate variant freq. of tones
Music music00 ( .ibeatNum(ibeatNum),
				.tone(freq)
);

// Generate particular freq. signal
PWM_gen toneGen ( .clk(clk), 
				  .rst(rst), 
				  .freq(freq),
				  .duty(DUTY_BEST), 
				  .PWM(pmod_1)
);

endmodule

module OnePulse (
    output reg signal_one_pulse,
	input wire signal,
	input wire clock
);
	
reg signal_delay;

always @(posedge clock) begin
	if (signal == 1'b1 & signal_delay == 1'b0)
	  signal_one_pulse <= 1'b1;
	else
	  signal_one_pulse <= 1'b0;
	
	signal_delay <= signal;
end

endmodule

module Debounce(
    input wire clk,
    input wire signal,
    output wire signal_deb
);

reg [4-1:0] dff;

always@(posedge clk)begin
    dff[3:1] <= dff[2:0];
    dff[0] <= signal;
end

assign signal_deb = (dff == 4'b1111)? 1'b1 : 1'b0;

endmodule

module mem_addr_gen(
   input clk_25MHz,
   input clk_22,
   input clk_20,
   input clk_21,
   input rst,
   input [9:0] h_cnt,
   input [9:0] v_cnt,
   input [3:0] enable,
   input [1:0] state,
   output [16:0] pixel_addr
   
   );
    
reg [7:0] position_v;
reg [8:0] position_h,h1,h2,h3,h6,h9;

wire start;

 //640*480 --> 320*240 
assign pixel_addr = (state == 2'b01) ? (((h_cnt>>1)+position_h)%320 + 320*(((v_cnt>>1)+ position_v)%240) % 76800) : 
                                  ((h_cnt>>2)%160 + 160*((v_cnt>>2)%120) % 19200); 
//assign pixel_addr = (h_cnt>>1)%320 + 320*((v_cnt>>1)%240) % 76800;
assign start = 1;

always@(posedge clk_25MHz)begin
    position_v <= 0;
    case(enable)
        1: position_h <= h1;
        2: position_h <= h2;
        3: position_h <= h3;
        5: position_h <= h1;
        6: position_h <= h6;
        8: position_h <= h1;
        9: position_h <= h9;
        10: position_h <= h3;
        default: position_h <= position_h;
    endcase
end

always @ (posedge clk_21 or posedge rst) begin
    if(rst) begin
        h1 <= 0;
        h9 <= 0;
    end
    else if(start)begin
        if(h1 > 0)
            h1 <= h1 - 1;
        else
            h1 <= 319;
            
        if(h9 < 319)
            h9 <= h9 + 1;
        else
            h9 <= 0;
    end
    else begin
        h1 <= h1;
        h9 <= h9;
    end
end

always @ (posedge clk_20 or posedge rst) begin
    if(rst) begin
        h2 <= 0;
        h3 <= 0;
    end
    else if(start)begin
        if(h3 > 0)
            h3 <= h3 - 1;
        else
            h3 <= 319;
            
        if(h2 < 319)
            h2 <= h2 + 1;
        else
            h2 <= 0;
    end
    else begin
        h2 <= h2;
        h3 <= h3;
    end
end

always @ (posedge clk_22 or posedge rst) begin
    if(rst) begin
        h6 <= 0;
    end
    else if(start)begin
        if(h6 < 319)
            h6 <= h6 + 1;
        else
            h6 <= 0;
    end
    else begin
        h6 <= h6;
    end
end
    
endmodule