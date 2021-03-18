//
//
//

module PlayerCtrl (
	input clk,
	input rst,
	output reg [8:0] ibeat
);

parameter BEATLEAGTH = 415;

always @(posedge clk, posedge rst) begin
	if (rst)
		ibeat <= 0;
	else if (ibeat < BEATLEAGTH) 
		ibeat <= ibeat + 1;
	else 
		ibeat <= 0;
end

endmodule