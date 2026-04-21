module divFreq(clk_in_50mhz, clk_out_1hz);
	input clk_in_50mhz;
	output reg clk_out_1hz;

	reg [24:0] contador;
	parameter [24:0] limite=25000000;
	always @(posedge clk_in_50mhz)
		begin
			contador = contador+1;
			if(contador >= (limite-1))
				begin
					contador <= 0;
					clk_out_1hz = ~clk_out_1hz;
					
				end
		end
		
	
	
	
endmodule


