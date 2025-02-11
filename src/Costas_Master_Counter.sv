// 'define TRIG1 = 500
module master_Counter#(
    parameter CLKDIV = 1000
    )(
'ifdef TRIG1
    output logic trigout, 
'endif
input logic clockin,
output logic clockout
);

    logic [32:0]count = 10'd0;
    logic clkstate = 0;
    always @(posedge clockin) begin
        case(count)
            CLKDIV:  begin
                        count <= 10'd0;
                        clkstate <= 1'b1;
                    end
        'ifdef TRIG1
            TRIG1+1: begin
                        count <= 10'd1;
                        trigstate <= 1'd0;
                   end
            T: begin
                        count <= 10'd0;
                        trigstate <= 1'b1;
                    end
        'endif
            0:  begin
                        count <= 10'd1;
                        clkstate <= 1'd0;
                   end
            default: begin 
                        count <= count + 1'd1;
                    end
        endcase
    end
    assign clockout = clkstate;
    'ifdef TRIG1 
        assign trigout = trigstate;
    'endif 
endmodule