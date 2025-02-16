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

  assign tuning_word = freqword(5000);
  assign phase_word = 8'd0;

  counter60 counter60(.clock(clock), .clock60(clock60), .trig(load));
  counter600 counter600(.clock(clock), .clock600(clock600));
  counter1000 counter1000(.clock(clock), .clock1000(clk10k));

  assign ledr[0] = ~load;
  assign ledr[1] = ~(clock60&(~clock600));
  assign ledr[2] = ~clock;
  assign update = clock60&(~clock600);


endmodule