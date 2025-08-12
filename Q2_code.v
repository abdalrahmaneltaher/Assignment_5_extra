module detect_010(X,clk,rst,Y,count);

parameter IDLE =2'b00 ;
parameter ZERO = 2'b01 ;
parameter ONE = 2'b10 ;
parameter STORE = 2'b11 ;

input X,clk,rst;

output reg Y;
output reg [9:0] count;

//current state (cs) and next state(ns)
reg [1:0] cs , ns;

//next state 
always @(*) begin
    case (cs)
        IDLE:
            begin
                if(X)
                    ns = IDLE;
                else
                    ns = ZERO;
            end  
        ZERO:
            begin
                if(X)
                    ns = ONE;
                else
                    ns = ZERO; 
            end
        ONE:
            begin
                if(X)
                    ns = IDLE;
                else
                    ns = STORE;
            end
        STORE:
            begin
                if(X)
                    ns = IDLE;
                else
                    ns = ZERO;
            end
        default: ns = IDLE ;
    endcase
end

// state memory 
always @(posedge clk or posedge rst ) begin
    if(rst)
        cs <= IDLE;
    else
        cs <= ns ; 
end

// output logic 
always @(posedge clk or posedge rst ) begin
    if (rst)begin
        count <= 0;
        Y <= 0;
    end
    else begin
        case (cs)
            IDLE  : Y <= 0 ;
            ZERO  : Y <= 0 ;
            ONE   : Y <= 0 ;
            STORE :
                begin
                    Y <= 1 ;
                    count <= count+1;
                end
        endcase
    end
end
endmodule
