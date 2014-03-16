module tlc(clk,reset,south_lights_gyr,north_lights_gyr,west_lights_gyr,east_lights_gyr);

parameter STOP_ALL             =5'd0;
parameter SOUTH_TO_ALL         =5'd1;
parameter SOUTH_TO_ALL_YLW     =5'd2;
parameter STOS_ALLTOLEFT       =5'd3;
parameter STOS_ALLTOLEFT_YLW   =5'd4;
parameter WEST_TO_ALL          =5'd5;
parameter WEST_TO_ALL_YLW      =5'd6;
parameter WTOW_ALLTOLEFT       =5'd7;
parameter WTOW_ALLTOLEFT_YLW   =5'd8;
parameter NORTH_TO_ALL         =5'd9;
parameter NORTH_TO_ALL_YLW     =5'd10;
parameter NTON_ALLTOLEFT       =5'd11;
parameter NTON_ALLTOLEFT_YLW   =5'd12;
parameter EAST_TO_ALL          =5'd13;
parameter EAST_TO_ALL_YLW      =5'd14;
parameter ETOE_ALLTOLEFT       =5'd15;
parameter ETOE_ALLTOLEFT_YLW   =5'd16;
parameter PEDESTRIAN           =5'd17;
                               
parameter DELAY_Y_TO_R = 2;    
parameter DELAY_1 = 5;

input clk,reset;
output [11:0] south_lights_gyr;
output [11:0] west_lights_gyr;
output [11:0] north_lights_gyr;
output [11:0] east_lights_gyr;
reg count_reset;
reg [4:0] nxt_st;
reg [4:0] reg_prsnt_st;
reg [3:0] count;
reg [15:0] green;
reg [15:0] red;
reg [15:0] yellow;

assign south_lights_gyr={green[15:12],yellow[15:12],red[15:12]};
assign west_lights_gyr={green[11:8],yellow[11:8],red[11:8]};
assign north_lights_gyr={green[7:4],yellow[7:4],red[7:4]};
assign east_lights_gyr={green[3:0],yellow[3:0],red[3:0]};
//@@@@@@@@@@@@@@@@@COUNTER FOR DELAY@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@/////
always@(posedge clk)
begin
if(!reset)
count<=0;
else if (count_reset==1'b1)
count<=0;
else
count<=count+1;
end
//@@@@@@@@@@@@@@@@@COUNTER FOR DELAY@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@/////


//**************//////STATE MACHINE FLIP-FLOPS///********************////
always@(posedge clk)
begin
if(!reset)
reg_prsnt_st<=STOP_ALL;
else
reg_prsnt_st<=nxt_st;
end
/////***************///STATE MACHINE FLIP-FLOPS///*******************////



//$$$$$$$$$$$$$$$$$$$$$$$$$/////NEXT STATE COMBO LOGIC////$$$$$$$$$$$$$/////
always@(reg_prsnt_st or count)
begin


//######################SOUTH############################################
////////////FROM SOUTH TO ALL ALLOWED..FROM ALL OTHER DIRECTIONS BLOCKED//
if (reg_prsnt_st==STOP_ALL && count==DELAY_1)
begin
nxt_st=SOUTH_TO_ALL;
count_reset=1;
end
////////////FROM SOUTH TO ALL ALLOWED..FROM ALL OTHER DIRECTIONS BLOCKED//




/////////////////GREEN TO YELLOW FOR SOUTH TO ALL state///////////////////
else if (reg_prsnt_st==SOUTH_TO_ALL && count==DELAY_1)
begin
nxt_st=SOUTH_TO_ALL_YLW;
count_reset=1;
end
/////////////////GREEN TO YELLOW FOR SOUTH TO ALL state///////////////////




////////////SOUTH TO SOUTH AND ALL LEFT ALLOWED///////////////////////////
else if (reg_prsnt_st==SOUTH_TO_ALL_YLW && count==DELAY_Y_TO_R)
begin
nxt_st=STOS_ALLTOLEFT;
count_reset=1;
end
////////////SOUTH TO SOUTH AND ALL LEFT ALLOWED///////////////////////////




/////////////////GREEN TO YELLOW FOR STOS_ALLTOLEFT state///////////////////
else if (reg_prsnt_st==STOS_ALLTOLEFT && count==DELAY_1)
begin
nxt_st=STOS_ALLTOLEFT_YLW;
count_reset=1;
end
/////////////////GREEN TO YELLOW FOR STOS_ALLTOLEFT state///////////////////
//######################SOUTH############################################


//######################WEST############################################
////////////FROM WEST TO ALL ALLOWED..FROM ALL OTHER DIRECTIONS BLOCKED//
else if (reg_prsnt_st==STOS_ALLTOLEFT_YLW && count==DELAY_1)
begin
nxt_st=WEST_TO_ALL;
count_reset=1;
end
////////////FROM WEST TO ALL ALLOWED..FROM ALL OTHER DIRECTIONS BLOCKED//




/////////////////GREEN TO YELLOW FOR WEST TO ALL state///////////////////
else if (reg_prsnt_st==WEST_TO_ALL && count==DELAY_1)
begin
nxt_st=WEST_TO_ALL_YLW;
count_reset=1;
end
/////////////////GREEN TO YELLOW FOR WEST TO ALL state///////////////////




////////////WEST TO WEST AND ALL LEFT ALLOWED///////////////////////////
else if (reg_prsnt_st==WEST_TO_ALL_YLW && count==DELAY_Y_TO_R)
begin
nxt_st=WTOW_ALLTOLEFT;
count_reset=1;
end
////////////WEST TO WEST AND ALL LEFT ALLOWED///////////////////////////




/////////////////GREEN TO YELLOW FOR WTOW_ALLTOLEFT state///////////////////
else if (reg_prsnt_st==WTOW_ALLTOLEFT && count==DELAY_1)
begin
nxt_st=WTOW_ALLTOLEFT_YLW;
count_reset=1;
end
/////////////////GREEN TO YELLOW FOR WTOW_ALLTOLEFT state///////////////////
//######################WEST############################################


//######################NORTH############################################
////////////FROM NORTH TO ALL ALLOWED..FROM ALL OTHER DIRECTIONS BLOCKED//
else if (reg_prsnt_st==WTOW_ALLTOLEFT_YLW && count==DELAY_1)
begin
nxt_st=NORTH_TO_ALL;
count_reset=1;
end
////////////FROM NORTH TO ALL ALLOWED..FROM ALL OTHER DIRECTIONS BLOCKED//




/////////////////GREEN TO YELLOW FOR NORTH TO ALL state///////////////////
else if (reg_prsnt_st==NORTH_TO_ALL && count==DELAY_1)
begin
nxt_st=NORTH_TO_ALL_YLW;
count_reset=1;
end
/////////////////GREEN TO YELLOW FOR NORTH TO ALL state///////////////////




////////////NORTH TO NORTH AND ALL LEFT ALLOWED///////////////////////////
else if (reg_prsnt_st==NORTH_TO_ALL_YLW && count==DELAY_Y_TO_R)
begin
nxt_st=NTON_ALLTOLEFT;
count_reset=1;
end
////////////NORTH TO NORTH AND ALL LEFT ALLOWED///////////////////////////




/////////////////GREEN TO YELLOW FOR NTON_ALLTOLEFT state///////////////////
else if (reg_prsnt_st==NTON_ALLTOLEFT && count==DELAY_1)
begin
nxt_st=NTON_ALLTOLEFT_YLW;
count_reset=1;
end
/////////////////GREEN TO YELLOW FOR NTON_ALLTOLEFT state///////////////////
//######################NORTH############################################


//######################EAST############################################
////////////FROM EAST TO ALL ALLOWED..FROM ALL OTHER DIRECTIONS BLOCKED//
else if (reg_prsnt_st==NTON_ALLTOLEFT_YLW && count==DELAY_1)
begin
nxt_st=EAST_TO_ALL;
count_reset=1;
end
////////////FROM EAST TO ALL ALLOWED..FROM ALL OTHER DIRECTIONS BLOCKED//




/////////////////GREEN TO YELLOW FOR EAST TO ALL state///////////////////
else if (reg_prsnt_st==EAST_TO_ALL && count==DELAY_1)
begin
nxt_st=EAST_TO_ALL_YLW;
count_reset=1;
end
/////////////////GREEN TO YELLOW FOR EAST TO ALL state///////////////////




////////////EAST TO EAST AND ALL LEFT ALLOWED///////////////////////////
else if (reg_prsnt_st==EAST_TO_ALL_YLW && count==DELAY_Y_TO_R)
begin
nxt_st=ETOE_ALLTOLEFT;
count_reset=1;
end
////////////EAST TO EAST AND ALL LEFT ALLOWED///////////////////////////




/////////////////GREEN TO YELLOW FOR ETOE_ALLTOLEFT state///////////////////
else if (reg_prsnt_st==ETOE_ALLTOLEFT && count==DELAY_1)
begin
nxt_st=ETOE_ALLTOLEFT_YLW;
count_reset=1;
end
/////////////////GREEN TO YELLOW FOR ETOE_ALLTOLEFT state///////////////////
//######################EAST############################################


//########################PEDESTRIAN###################################
else if (reg_prsnt_st==ETOE_ALLTOLEFT_YLW && count==DELAY_Y_TO_R)
begin
nxt_st=PEDESTRIAN;
count_reset=1;
end
//########################PEDESTRIAN###################################

//########BACK TO INITIAL STATE############///////////////////////////////////////
else if (reg_prsnt_st==PEDESTRIAN && count==DELAY_1)
begin
nxt_st=SOUTH_TO_ALL;
count_reset=1;
end
//########BACK TO INITIAL STATE############///////////////////////////////////////

//$$$$$$$$$$$$$$DONT CHANGE STATE$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$//
else
begin
nxt_st=reg_prsnt_st;
count_reset=0;
end
//$$$$$$$$$$$$$$DONT CHANGE STATE$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$//
end
/////////NEXT STATE COMBO LOGIC/////////






//^^^^^^^^^^^^^^^^^^^^^^ENCODER^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^////////////
always@(*)
begin
if(reg_prsnt_st==STOP_ALL)
begin
green[15:0]=16'h0000;
red[15:0]=16'h1111;
yellow[15:0]=16'h0000;
end
else if(reg_prsnt_st==SOUTH_TO_ALL)
begin
green[15:0]=16'hF000;
red[15:0]=16'h0FFF;
yellow[15:0]=16'h0000;
end
else if(reg_prsnt_st==SOUTH_TO_ALL_YLW)
begin
green[15:0]=16'h9888;
red[15:0]=16'h0777;
yellow[15:0]=16'h6000;
end
else if(reg_prsnt_st==STOS_ALLTOLEFT)
begin
green[15:0]=16'h9888;
red[15:0]=16'h6777;
yellow[15:0]=16'h0000;
end
else if(reg_prsnt_st==STOS_ALLTOLEFT_YLW)
begin
green[15:0]=16'h0F00;
red[15:0]=16'h6077;
yellow[15:0]=16'h9088;
end
else if(reg_prsnt_st==WEST_TO_ALL)
begin
green[15:0]=16'h0F00;
red[15:0]=16'hF0FF;
yellow[15:0]=16'h0000;
end
else if(reg_prsnt_st==WEST_TO_ALL_YLW)
begin
green[15:0]=16'h8988;
red[15:0]=16'h7077;
yellow[15:0]=16'h0600;
end
else if(reg_prsnt_st==WTOW_ALLTOLEFT)
begin
green[15:0]=16'h8988;
red[15:0]=16'h7677;
yellow[15:0]=16'h0000;
end
else if(reg_prsnt_st==WTOW_ALLTOLEFT_YLW)
begin
green[15:0]=16'h00F0;
red[15:0]=16'h7607;
yellow[15:0]=16'h8908;
end
else if(reg_prsnt_st==NORTH_TO_ALL)
begin
green[15:0]=16'h00F0;
red[15:0]=16'hFF0F;
yellow[15:0]=16'h0000;
end
else if(reg_prsnt_st==NORTH_TO_ALL_YLW)
begin
green[15:0]=16'h8898;
red[15:0]=16'h7707;
yellow[15:0]=16'h0060;
end
else if(reg_prsnt_st==NTON_ALLTOLEFT)
begin
green[15:0]=16'h8898;
red[15:0]=16'h7767;
yellow[15:0]=16'h0000;
end
else if(reg_prsnt_st==NTON_ALLTOLEFT_YLW)
begin
green[15:0]=16'h000F;
red[15:0]=16'h7760;
yellow[15:0]=16'h8890;
end
else if(reg_prsnt_st==EAST_TO_ALL)
begin
green[15:0]=16'h000F;
red[15:0]=16'hFFF0;
yellow[15:0]=16'h0000;
end
else if(reg_prsnt_st==EAST_TO_ALL_YLW)
begin
green[15:0]=16'h8889;
red[15:0]=16'h7770;
yellow[15:0]=16'h0006;
end
else if(reg_prsnt_st==ETOE_ALLTOLEFT)
begin
green[15:0]=16'h8889;
red[15:0]=16'h7776;
yellow[15:0]=16'h0000;
end
else if(reg_prsnt_st==ETOE_ALLTOLEFT_YLW)
begin
green[15:0]=16'h0000;
red[15:0]=16'h7776;
yellow[15:0]=16'h8889;
end
else if(reg_prsnt_st==PEDESTRIAN)
begin
green[15:0]=16'h0000;
red[15:0]=16'hFFFF;
yellow[15:0]=16'h0000;
end
else
begin
green[15:0]=16'h0000;
red[15:0]=16'hFFFF;
yellow[15:0]=16'h0000;
end


end
//^^^^^^^^^^^^^^^^^^^^^^ENCODER^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^////////////





endmodule
