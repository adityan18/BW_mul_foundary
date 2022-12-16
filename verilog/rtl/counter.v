module fa(
    input clk, rst,
    output reg [7:0] count );
    always @(posedge clk) begin
        if (rst) begin
            count <= 8'b00000001;
        end
        else begin
            count <= count<<1;
            count[0] <= count[7];
        end
    end
endmodule
