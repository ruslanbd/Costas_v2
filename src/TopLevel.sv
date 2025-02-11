// 'define TRIG1
module Costas_TopLevel#(parameter PSK_SIGNAL_RATE_HZ = 125)(
  input logic sys_clk, // 27MHz embedded clock
  input logic pps, // 1Hz pulse
  input logic clk10M_w, // 10MHz clock
  input logic costas_txrq, // Costas array transmission request
  input logic psk_txrq, // PSK transmission request
  output logic mcu_costas_trigger, // Costas array trigger
  output logic mcu_costas_clk, // Costas array clock
  output logic mcu_psk_trigger, // PSK trigger
  output logic mcu_psk_clk, // PSK clock
  output logic fq_ud // Frequency update request
);
  wire clk10k;
  wire clock60;
  wire clock600;

  counter60   counter60(.clock(clk10M_w), .clock60(clock60));
  counter600  counter600(.clock(clk10M_w), .clock600(clock600));
  counter1000 counter1000(.clock(clk10M_w), .clock1000(clk10k));
  master_Counter master_Counter(.clockin(clk10M_w), .clockout(mcu_costas_clk));


endmodule