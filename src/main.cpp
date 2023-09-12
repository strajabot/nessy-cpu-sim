// For std::unique_ptr
#include <memory>
#include <cstdint>
// Include common routines
#include <verilated.h>
#include <verilated_vcd_c.h>

#include "Vcpu.h"
#include "gpu.hpp"
#include "memory.hpp"

double sc_time_stamp() { return 0; }

int main() {
	
	Verilated::mkdir("logs");
	
	const std::unique_ptr<VerilatedContext> ctx{new VerilatedContext()};
	
	ctx->debug(0);
	ctx->randReset(0);
	ctx->traceEverOn(true);

	const std::unique_ptr<Vcpu> cpu {new Vcpu{ctx.get(), "cpu"}};

	VerilatedVcdC* trace_file = new VerilatedVcdC();
	cpu->trace(trace_file, 100);

	trace_file->open("logs/trace.vcd");

	GPU gpu;
	Memory memory;

	cpu->CLK = 0;
	cpu->nNMI = 1;
	cpu->nIRQ = 1;
	cpu->DIN = 0;
	cpu->FC = 0;

	int clock = 1;	
	// Simulate until $finish
	int k = 0;
	while (!ctx->gotFinish()) {
		cpu->FC = false;
		
		if ((cpu->RD || cpu->WR) && !(memory.update(cpu, clock) ||
			gpu.update(cpu, clock))) {
			k++;
			if (k == 5) {
			cpu->FC = true;
			cpu->DIN = 0xFC;
			printf("[%zu] ERROR: No device answered a memory request: RD=%d, WR=%d\n",
				clock, cpu->RD, cpu->WR);
				k = 0;
			}
		} else {
			k = 0;
		}

		cpu->eval();
		trace_file->dump(ctx->time());
			
		//Rastuca ivica;
		ctx->timeInc(1);
		cpu->CLK = !cpu->CLK;
		cpu->eval();
		trace_file->dump(ctx->time());
	

		//Padajuca Ivica;
		ctx->timeInc(1);
		cpu->CLK = !cpu->CLK;
		//cpu->eval();

		//Sledeci korak;
		if(clock == 240000) break;
		clock++;
	}


	// Final model cleanup
	cpu->final();

	// Coverage analysis (calling write only after the test is known to pass)
#if VM_COVERAGE
	Verilated::mkdir("logs");
	ctx->coveragep()->write("logs/coverage.dat");
#endif

	// Return good completion status
	// Don't use exit() or destructor won't get called
	return 0;
}

