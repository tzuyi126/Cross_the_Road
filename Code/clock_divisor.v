module clock_divisor(clk1, clk, clk22,clk20,clk21,clk23,clk17,clk19);
input clk;
output clk1;
output clk22;
output clk20;
output clk21;
output clk23;
output clk17;
output clk19;
reg [25:0] num;
wire [25:0] next_num;

always @(posedge clk) begin
  num <= next_num;
end

assign next_num = num + 1'b1;
assign clk1 = num[1];
assign clk17 = num[16];
assign clk22 = num[21];
assign clk20 = num[19];
assign clk21 = num[20];
assign clk23 = num[22];
assign clk19 = num[18];
endmodule
