`timescale 1ns/10ps //default timescale the uses
module tb;
reg clk;
wire clk1;
real freq;
real tp;
real duty, jitter;
real freq_jitter, tp_jitter;
real prev_clock_edge_time, cur_clock_edge_time, tp_calc, freq_calc;

initial begin
$value$plusargs("freq=%f",freq); //C language? scanf
$value$plusargs("duty=%f",duty); //C language? scanf
$value$plusargs("jitter=%f",jitter); //C language? scanf
//freq = 200;
//duty = 50;
//jitter = 5;

forever begin
	freq_jitter = freq * $urandom_range(100-jitter, 100+jitter)/100.0;
	tp_jitter = 1000/freq_jitter;
	clk = 0;
	#(tp_jitter*(100-duty)/100); //low time
	clk = 1;
	#(tp_jitter*duty/100); //high time
end
