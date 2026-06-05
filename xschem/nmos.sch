v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -100 -0 -40 -0 {lab=vgs}
N 0 -70 -0 -30 {lab=#net1}
N -100 -70 -100 -0 {lab=vgs}
N -100 60 -0 60 {lab=GND}
N -0 30 -0 60 {lab=GND}
N -0 60 -0 80 {lab=GND}
N -0 -0 110 0 {lab=#net2}
N 110 -0 110 10 {lab=#net2}
N 30 70 110 70 {lab=GND}
N 30 60 30 70 {lab=GND}
N 0 60 30 60 {lab=GND}
N -100 -70 -80 -70 {lab=vgs}
N -20 -70 -0 -70 {lab=#net1}
C {sky130_fd_pr/nfet_01v8.sym} -20 0 0 0 {name=M2
L=1
W=5  
nf=1 mult=1
model=nfet_01v8
spiceprefix=X
}
C {vsource.sym} -100 30 0 0 {name=vgs value=5 savecurrent=false}
C {gnd.sym} 0 80 0 0 {name=l1 lab=GND}
C {vsource.sym} 110 40 0 0 {name=vsb value=0 savecurrent=false}
C {simulator_commands_shown.sym} 150 -50 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value=".DC Vgs 0 5 0.001

.CONTROL
run

* Drain current
plot i(vid)
plot v(vgs)

* sqrt(2*Id)
*plot sqrt(2*(i(id))) vs v(id)

.ENDC

.END
"}
C {devices/code.sym} -370 -180 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {vsource.sym} -50 -70 3 0 {name=vid value=0 savecurrent=false}
C {lab_wire.sym} -100 -70 0 0 {name=p1 sig_type=std_logic lab=vgs}
