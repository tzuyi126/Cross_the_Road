module pixel_gen(
   input rst,
   input [9:0] h_cnt,
   input [9:0] v_cnt,
   input valid,
   input [11:0] pixel0,
   input [11:0] pixel1,
   input [11:0] pixel2,
   input [8:0] player_v,
   input [9:0] player_h,
   output reg [3:0] vgaRed,
   output reg [3:0] vgaGreen,
   output reg [3:0] vgaBlue,
   input l1,
   input l2,
   input l3,
   input[1:0] state
   );
   
//level
wire [9:0]level1, level2, level3;

assign level1 = 40;
assign level2 = 320;
assign level3 = 600;


always @(*) begin
    if(!valid)
        {vgaRed, vgaGreen, vgaBlue} = 12'h0;
    else if(state == 2'b00)begin
        {vgaRed, vgaGreen, vgaBlue} = pixel0;
    end
    else if(state == 2'b01)begin
        if(v_cnt >= 0 && v_cnt <35)begin
            if(h_cnt >= level1-20 && h_cnt < level1+20 && l1 == 0) begin
                {vgaRed, vgaGreen, vgaBlue} = 12'h000;
            end
            else if (h_cnt >= level2-20 && h_cnt < level2+20 && l2 == 0)begin
                {vgaRed, vgaGreen, vgaBlue} = 12'h000;
            end
            else if (h_cnt >= level3-20 && h_cnt < level3+20 && l3 == 0)begin
                {vgaRed, vgaGreen, vgaBlue} = 12'h000;
            end
            else begin
                if(v_cnt >= player_v-15 && v_cnt <= player_v+15)begin
                    if(h_cnt >= player_h-15 && h_cnt <= player_h+15)begin
                        if(v_cnt >= player_v-10 && v_cnt <= player_v)begin
                            if(h_cnt >= player_h-5 && h_cnt <= player_h+5)
                                {vgaRed, vgaGreen, vgaBlue} = 12'hf00;
                            else
                                {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                        end
                        else
                            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                    end
                    else
                        {vgaRed, vgaGreen, vgaBlue} = pixel1;
                end
                else
                    {vgaRed, vgaGreen, vgaBlue} = pixel1;
            end
        end
        else if(v_cnt >= player_v-15 && v_cnt <= player_v+15)begin
            if(h_cnt >= player_h-15 && h_cnt <= player_h+15)begin
                if(v_cnt >= player_v-10 && v_cnt <= player_v)begin
                    if(h_cnt >= player_h-5 && h_cnt <= player_h+5)
                        {vgaRed, vgaGreen, vgaBlue} = 12'hf00;
                    else
                        {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
                end
                else
                    {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
            end
            else
                {vgaRed, vgaGreen, vgaBlue} = pixel1;
        end
        else 
            {vgaRed, vgaGreen, vgaBlue} = pixel1;
    end
    else if(state == 2'b11)begin
        {vgaRed, vgaGreen, vgaBlue} = pixel2;
    end
    else
        {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
end

endmodule