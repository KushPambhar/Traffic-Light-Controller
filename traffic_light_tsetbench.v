
module traffic_light_tb;

	reg clk , reset;
	wire red,yellow,green;
	
traffic_light uut (
.clk(clk),
.reset(reset),
.red(red),
.yellow(yellow),
.green(green)
);

	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end

	initial begin
		reset = 0;
		#20;
		reset = 1;
	end

	initial begin
		#400 $finish;
	end

	initial begin
		$monitor("Time=%0t reset=%b red=%b yellow=%b green=%b",$time, reset, red, yellow, green);
	end
 
	initial begin
  		$dumpfile("dump.vcd");
      $dumpvars(0,clk,reset,red,yellow,green);
	end
endmodule
