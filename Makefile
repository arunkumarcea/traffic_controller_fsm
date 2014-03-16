WRK_DIR = /home/arkuma/probation/traffic_controller
SRC_FIL = tb_tlc.v
TOP_MODULE = tb_tlc

all:sim
sim:elab
	bsub -q small -I ncsim worklib.$(TOP_MODULE):module
elab:compile
	bsub -q small -I ncelab -access +r worklib.$(TOP_MODULE):module
compile:	
	bsub -q small -I ncvlog -sv $(SRC_FIL)


clean :
	rm -rf *.trn *.dsn 
	rm -rf ./INCA_libs/worklib/*



