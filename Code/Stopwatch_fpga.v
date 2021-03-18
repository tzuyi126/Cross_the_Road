`timescale 1ns / 1ps

module stopwatch(clk, clk_17, rst, start, finish, AN, seg, dot);
input clk;
input clk_17;
input rst;
input start;
input finish;
output reg [4-1:0] AN;
output reg [7-1:0] seg;
output reg dot;

reg [2-1:0] count_an,next_count_an;

reg state = 1'b0;
reg next_state;
parameter RESET = 1'b0;
parameter COUNT = 1'b1;

reg [4-1:0] min,next_min;
reg [4-1:0] sec0,next_sec0;
reg [3-1:0] sec1,next_sec1;
reg [4-1:0] msec,next_msec;

wire [7-1:0] seg0,seg1,seg2,seg3;

// create clk_watch
wire clk_watch;
reg [27-1:0] clk_wcounter; // count to 10000000
always@(posedge clk)begin
    if(rst)
        clk_wcounter <= 1;
    else if(clk_wcounter == 10000000)
        clk_wcounter <= 1;
    else
        clk_wcounter <= clk_wcounter + 1;
end
assign clk_watch = (clk_wcounter == 10000000)? 1 : 0;

reg start_reg = 0;
always@(posedge clk_watch or posedge start)begin
    if(start==1)
        start_reg <= 1;
    else
        start_reg <= 0;
end


always@(posedge clk_watch or posedge rst or posedge finish)begin
    if(rst)begin
        state <= RESET;
        min <= 0;
        sec0 <= 0;
        sec1 <= 0;
        msec <= 0;
    end
    else begin
        state <= next_state;
        min <= (finish == 1)? min : next_min;
        sec0 <= (finish == 1)? sec0 : next_sec0;
        sec1 <= (finish == 1)? sec1 : next_sec1;
        msec <= (finish == 1)? msec : next_msec;
    end
end

always@(*)begin
    next_min = min;
    next_sec0 = sec0;
    next_sec1 = sec1;
    next_msec = msec;
    case(state)
        RESET:begin
            next_state = (start_reg == 1)? COUNT : RESET;
            next_min = 0;
            next_sec0 = 0;
            next_sec1 = 0;
            next_msec = (start_reg == 1)? 1 : 0;
        end
        COUNT:begin
            next_state = (min == 9 && sec1 == 5 && sec0 == 9 && msec == 9)? RESET : COUNT;
            next_msec = (msec < 4'd9)? msec+1 : 0;  // msec
            
            if(msec == 9)                           // sec0
                next_sec0 = (sec0 < 9)? sec0+1 : 0;
                
            if(sec0 == 9 && msec == 9)               // sec1
                next_sec1 = (sec1 < 5)? sec1+1 : 0;
                
            if(sec1 == 5 && sec0 == 9 && msec == 9)  // min
                next_min = (min < 9)? min+1 : 0;
        end
        default:begin
            next_state = RESET;
        end
    endcase
end

// msec
assign seg0[0] = (msec == 0 || msec == 2 || msec == 3 || msec == 5 || msec == 6 || msec == 7 || msec == 8 || msec == 9)? 0 : 1;
assign seg0[1] = (msec == 0 || msec == 1 || msec == 2 || msec == 3 || msec == 4 || msec == 7 || msec == 8 || msec == 9)? 0 : 1;
assign seg0[2] = (msec == 0 || msec == 1 || msec == 3 || msec == 4 || msec == 5 || msec == 6 || msec == 7 || msec == 8 || msec == 9)? 0 : 1;
assign seg0[3] = (msec == 0 || msec == 2 || msec == 3 || msec == 5 || msec == 6 || msec == 8 || msec == 9)? 0 : 1;
assign seg0[4] = (msec == 0 || msec == 2 || msec == 6 || msec == 8)? 0 : 1;
assign seg0[5] = (msec == 0 || msec == 4 || msec == 5 || msec == 6 || msec == 8 || msec == 9)? 0 : 1;
assign seg0[6] = (msec == 2 || msec == 3 || msec == 4 || msec == 5 || msec == 6 || msec == 8 || msec == 9)? 0 : 1;
// sec0
assign seg1[0] = (sec0 == 0 || sec0 == 2 || sec0 == 3 || sec0 == 5 || sec0 == 6 || sec0 == 7 || sec0 == 8 || sec0 == 9)? 0 : 1;
assign seg1[1] = (sec0 == 0 || sec0 == 1 || sec0 == 2 || sec0 == 3 || sec0 == 4 || sec0 == 7 || sec0 == 8 || sec0 == 9)? 0 : 1;
assign seg1[2] = (sec0 == 0 || sec0 == 1 || sec0 == 3 || sec0 == 4 || sec0 == 5 || sec0 == 6 || sec0 == 7 || sec0 == 8 || sec0 == 9)? 0 : 1;
assign seg1[3] = (sec0 == 0 || sec0 == 2 || sec0 == 3 || sec0 == 5 || sec0 == 6 || sec0 == 8 || sec0 == 9)? 0 : 1;
assign seg1[4] = (sec0 == 0 || sec0 == 2 || sec0 == 6 || sec0 == 8)? 0 : 1;
assign seg1[5] = (sec0 == 0 || sec0 == 4 || sec0 == 5 || sec0 == 6 || sec0 == 8 || sec0 == 9)? 0 : 1;
assign seg1[6] = (sec0 == 2 || sec0 == 3 || sec0 == 4 || sec0 == 5 || sec0 == 6 || sec0 == 8 || sec0 == 9)? 0 : 1;
// sec1
assign seg2[0] = (sec1 == 0 || sec1 == 2 || sec1 == 3 || sec1 == 5)? 0 : 1;
assign seg2[1] = (sec1 == 0 || sec1 == 1 || sec1 == 2 || sec1 == 3 || sec1 == 4)? 0 : 1;
assign seg2[2] = (sec1 == 0 || sec1 == 1 || sec1 == 3 || sec1 == 4 || sec1 == 5)? 0 : 1;
assign seg2[3] = (sec1 == 0 || sec1 == 2 || sec1 == 3 || sec1 == 5)? 0 : 1;
assign seg2[4] = (sec1 == 0 || sec1 == 2)? 0 : 1;
assign seg2[5] = (sec1 == 0 || sec1 == 4 || sec1 == 5)? 0 : 1;
assign seg2[6] = (sec1 == 2 || sec1 == 3 || sec1 == 4 || sec1 == 5)? 0 : 1;
// min
assign seg3[0] = (min == 0 || min == 2 || min == 3 || min == 5 || min == 6 || min == 7 || min == 8 || min == 9)? 0 : 1;
assign seg3[1] = (min == 0 || min == 1 || min == 2 || min == 3 || min == 4 || min == 7 || min == 8 || min == 9)? 0 : 1;
assign seg3[2] = (min == 0 || min == 1 || min == 3 || min == 4 || min == 5 || min == 6 || min == 7 || min == 8 || min == 9)? 0 : 1;
assign seg3[3] = (min == 0 || min == 2 || min == 3 || min == 5 || min == 6 || min == 8 || min == 9)? 0 : 1;
assign seg3[4] = (min == 0 || min == 2 || min == 6 || min == 8)? 0 : 1;
assign seg3[5] = (min == 0 || min == 4 || min == 5 || min == 6 || min == 8 || min == 9)? 0 : 1;
assign seg3[6] = (min == 2 || min == 3 || min == 4 || min == 5 || min == 6 || min == 8 || min == 9)? 0 : 1;

always@(posedge clk_17)begin
    if(rst)
        count_an <= 0;
    else
        count_an <= next_count_an;
end

// display
always@(*)begin
    case(count_an)
        2'b00:begin
            AN = 4'b1110;
            dot = 1;
            next_count_an = count_an+1;
            seg = seg0;
        end
        2'b01:begin
            AN = 4'b1101;
            dot = 0;
            next_count_an = count_an+1;
            seg = seg1;
        end
        2'b10:begin
            AN = 4'b1011;
            dot = 1;
            next_count_an = count_an+1;
            seg = seg2;
        end
        2'b11:begin
            AN = 4'b0111;
            dot = 0;
            next_count_an = count_an+1;
            seg = seg3;
        end
        default:begin
            next_count_an = 0;
        end
    endcase
end

endmodule