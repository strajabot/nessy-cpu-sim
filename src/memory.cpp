#include "memory.hpp"

#include <fstream>

Memory::Memory()
{
	ram = new uint8_t[mem_map[RAM][SIZE]];
	crom = new uint8_t[mem_map[CROM][SIZE]];
	cvec = new uint8_t[mem_map[CVEC][SIZE]];

	std::ifstream crom_stream("bin/crom.bin");
	std::ifstream cvec_stream("bin/cvec.bin");

	crom_stream.read((char*)crom, mem_map[CROM][SIZE]);
	cvec_stream.read((char*)cvec, mem_map[CVEC][SIZE]);

	crom_stream.close();
	cvec_stream.close();
}

bool Memory::update(const std::unique_ptr<Vcpu>& cpu, uint64_t clock)
{
	if(clock < fc_set) return true;
	if(clock == fc_set) 
	{
		cpu->FC = true;
		return true;
	}
	if(clock == fc_set + 1) cpu->FC = false;

	if(!cpu->RD && !cpu->WR) return false;
	uint16_t address = cpu->A;
	uint64_t data = cpu->DOUT;

	if(cpu->WR && cpu->RD) VL_PRINTF("[%zu] ERROR: BOTH READ AND WRITE ACTIVE ", clock); 
	
	if (checkRange(address, RAM))
	{
		if (cpu->RD)
		{
			cpu->DIN = readRAM(address, clock);
			return true;
		}
		else
		{
			writeRAM(address, data, clock);
			return true;	
		}
	}
	
	if(cpu->RD && checkRange(address,CROM))
	{
		cpu->DIN = readCROM(address, clock);
		return true;
	}
	
	if(cpu->RD && checkRange(address, CVEC))
	{
		cpu->DIN = readCVEC(address, clock);
		return true;
	}

	return false;
}

bool Memory::checkRange(uint16_t address, MEM_TYPES module)
{
	return (address >= mem_map[module][START]) && (address < (mem_map[module][START] + mem_map[module][SIZE]));
}

uint8_t Memory::readRAM(uint16_t address, uint64_t clock)
{
	fc_set = clock + 2;
	return ram[address - mem_map[RAM][START]];
}

void Memory::writeRAM(uint16_t address, uint8_t data, uint64_t clock)
{
	fc_set = clock + 1;
	ram[address - mem_map[RAM][START]] = data;
}

uint8_t Memory::readCROM(uint16_t address, uint64_t clock)
{
	fc_set = clock + 2;
	return crom[address - mem_map[CROM][START]];
}

uint8_t Memory::readCVEC(uint16_t address,uint64_t clock)
{
	fc_set = clock + 2;
	return cvec[address - mem_map[CVEC][START]];
}

