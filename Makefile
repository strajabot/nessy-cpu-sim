ifneq ($(words $(CURDIR)),1)
 $(error Unsupported: GNU Make cannot build in directories containing spaces, build elsewhere: '$(CURDIR)')
endif

BDF_DIR=nessy/src
VERILOG_DIR=verilog

$(shell if [ ! -f Makefile.user ]; then cp Makefile.user.example Makefile.user; fi)

TLE=cpu/cpu
CORE_COUNT=4

default: verilog run

SOURCES_BDF = $(shell find $(BDF_DIR) -name "*.bdf" -printf "%P ")
SOURCES_VERILOG = $(addprefix $(VERILOG_DIR)/,$(SOURCES_BDF:.bdf=.v))
SOURCES_VERILOG += $(addprefix $(VERILOG_DIR)/,$(shell find $(BDF_DIR) -name "*.v" -printf "%P "))
INCLUDE_FOLDERS = $(shell find ./nessy/src -type d -printf "-I${VERILOG_DIR}/%P ")
INCLUDE_FOLDERS += -CFLAGS -I../h 
#-CFLAGS "-I../h -g -ggdb"

${VERILOG_DIR}/%.v: ${BDF_DIR}/%.bdf
	quartus_map --convert_bdf_to_verilog=$<
	dirname $@ | xargs mkdir --parents
	mv $(BDF_DIR)/$*.v $@

${VERILOG_DIR}/%.v: ${BDF_DIR}/%.v
	cp $< $@

.PHONY: verilog
verilog: $(SOURCES_VERILOG)

ifeq ($(VERILATOR_ROOT),)
VERILATOR = verilator
else
export VERILATOR_ROOT
VERILATOR = $(VERILATOR_ROOT)/bin/verilator
endif

# Generate C++ in executable form
VERILATOR_FLAGS += -cc --exe

# Generate makefile dependencies (not shown as complicates the Makefile)
#VERILATOR_FLAGS += -MMD

# Optimize
VERILATOR_FLAGS += -x-assign fast

# Warn abount lint issues; may not want this on less solid designs
VERILATOR_FLAGS += -Wno-fatal

# Make waveforms
VERILATOR_FLAGS += --trace

# Run Verilator in debug mode
#VERILATOR_FLAGS += --debug

# Add this trace to get a backtrace in gdb
VERILATOR_FLAGS += --gdbbt

# Set output directory
VERILATOR_FLAGS += --Mdir build

# Compile the verilated files
VERILATOR_FLAGS += --build

# Input files for Verilator
VERILATOR_INPUT =  +librescan +libext+.v+.sv+.vh+.svh -y . $(INCLUDE_FOLDERS) verilog/${TLE}.v $(shell find src -name "*.cpp" -printf "src/%P ")
VERILATOR_INPUT += -CFLAGS "-g -ggdb"  --build-jobs 4

run:
	@echo
	@echo "COMPILE TEST: ------------"
	make -C tests
	
	@echo
	@echo "VERILATE: ----------------"
	$(VERILATOR) $(VERILATOR_FLAGS) $(VERILATOR_INPUT)
	
	@echo
	@echo "RUN: ---------------------"
	@rm -rf logs
	@mkdir -p logs
	build/V${shell basename ${TLE}} +trace
	
	@echo
	@echo "DONE: -------------------"
	@echo


######################################################################
# Other targets

show-config:
	$(VERILATOR) -V

maintainer-copy::
clean mostlyclean distclean maintainer-clean::
	-rm -rf build logs *.log *.dmp *.vpd coverage.dat core
