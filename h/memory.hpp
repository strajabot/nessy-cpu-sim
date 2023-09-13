#ifndef MEMORY_HPP
#define MEMORY_HPP

#include "component.hpp"
#include <cstdint>

class Memory : public Component {
public:
	Memory();
	Memory(const Memory& memory) = delete;
	Memory(Memory&& memory) = delete;

	Memory& operator=(const Memory& memory) = delete;
	Memory& operator=(Memory&& memory) = delete;

	bool update(const std::unique_ptr<Vcpu>& cpu, uint64_t clock) override;

	void dump();

private:
	enum MEM_TYPES {
		RAM, CROM, CVEC
	};

	enum MAP_FIELD {
		START, SIZE
	};

	static const constexpr uint16_t mem_map[3][2] =
	{
		{0x0000, 0x2000},
		{0x8000, 0x4000},
		{0xFFFA, 0x0006}
	};

	uint64_t fc_set = 0; 

	uint8_t* ram;
	uint8_t* crom;
	uint8_t* cvec;

	bool checkRange(uint16_t address, MEM_TYPES module);

	void writeRAM(uint16_t address, uint8_t data, uint64_t clock);
	uint8_t readRAM(uint16_t address, uint64_t clock);
	uint8_t readCROM(uint16_t address, uint64_t clock);
	uint8_t readCVEC(uint16_t address, uint64_t clock);
	
};

#endif
