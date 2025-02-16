module counter60(
input clock,
output wire clock60,
output reg trig
);

    reg [5:0]count = 6'd0;
    reg clkstate = 0;
    always @(posedge clock) begin
        case(count)
            6'd14:  begin
                        count <= 6'd0;
                        clkstate <= 1'b1;
                    end
            6'd13:  begin
                        count <= 6'd14;
                        trig <= 0;
                    end
            6'd12:  begin
                        count <= 6'd13;
                        trig <= 1;
                    end
            6'd0:  begin
                        count <= 6'd1;
                        clkstate <= 1'd0;
                   end
            default: begin 
                        count <= count + 1'd1;
                    end
        endcase
    end
    assign clock60 = clkstate; 
endmodule