module traffic_light(clk,reset,red,green,yellow);
    input clk,reset;
    output reg red,green,yellow;

    parameter R = 2'b00;
    parameter Y = 2'b01;
    parameter G = 2'b10;

    reg [1:0] ps, ns;
    
    parameter R_time = 10;
    parameter Y_time = 3;
    parameter G_time = 7;

    reg[31:0] cnt;
    always @(posedge clk or negedge reset) begin
        if(!reset) begin
            ps<=R;
            cnt <= 0;
        end
        else begin
            ps<=ns;
            cnt<=cnt+1;
        end
    end

    always @(clk) begin
        case(ps)
            R : if(cnt == R_time) begin
                    ns = Y;
                    cnt = 0;
            end
                else
                    ns = R;
                red = 1'b1;
                yellow = 1'b0;
                green = 1'b0;
            Y : if(cnt == Y_time) begin
                    ns = G;
                    cnt = 0;
            end
                else
                    ns = Y;
                red = 1'b0;
                yellow = 1'b1;
                green = 1'b0;
            G : if(cnt == G_time) begin
                    ns = R;
                    cnt = 0;
            end
                else
                    ns = G;
                red = 1'b0;
                yellow = 1'b0;
                green = 1'b1;
            default :
                ns = R;
                red = 1'b1;
                yellow = 1'b0;
                green = 1'b0;
        endcase
    end
endmodule


                
