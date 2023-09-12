#include "gpu.hpp"

#include <cstdint>
 
GPU::GPU()
{
	//todo: Sta treba da stoji ovde;
}

bool GPU::update(const std::unique_ptr<Vcpu>& cpu, uint64_t clock)
{
	if (clFC) cpu->FC = false, clFC = false;
	update_nmi(cpu, clock);

	uint16_t address = cpu->A;

	//update renderers

	update_gpu(cpu, address, clock);


	if(!cpu->RD && !cpu->WR) return false;

	if(address < 0x2000 || address > 0x3FFF) return false;

	address %= 8;

	if (cpu->RD)
	{
		if (address == 0)
		{
			cpu->DIN = read_status();
			cpu->FC = true;
			clFC = true;
			return true;
		}

	}
	else
	{		switch (address)
		{
			case 0:
				write_control(cpu, cpu->DOUT);
				cpu->FC = true;
				clFC = true;
				return true;
			break;
			case PIXEL_LOW:
			case PIXEL_HIGH:
				write_pixel(address == PIXEL_HIGH, cpu->DOUT);
				cpu->FC = true;
				clFC = true;
				return true;
			break;
			case LINE_LOW:
			case LINE_HIGH:
				write_line(address == LINE_HIGH, cpu->DOUT);
				cpu->FC = true;
				clFC = true;
				return true;
			break;
			case RECT_LOW:
			case RECT_HIGH:
				write_rect(address == RECT_HIGH, cpu->DOUT);
				cpu->FC = true;
				clFC = true;
				return true;
			break;
			default:
				return false;

		}
	}
	return false; 
}

void GPU::update_nmi(const std::unique_ptr<Vcpu>& cpu, uint64_t clock)
{
	if(clock % (1040*665) == 0)
		cpu->nNMI = !(control & NMI_MASK);
	if ((clock - 1040*64) % (1040*665) == 0)
		cpu->nNMI = 1;
}

void GPU::update_gpu(const std::unique_ptr<Vcpu>& cpu, uint64_t address, uint64_t clock)
{
}

uint8_t GPU::read_status()
{
	uint8_t status = !pixel_idx[1]; status <<= 1;
	status = !pixel_idx[0]; status <<= 1;
	status = !line_idx[1]; status <<= 1;
	status = !line_idx[0]; status <<= 1;
	status = !rect_idx[1]; status <<= 1;
	status = !rect_idx[0]; status <<= 1;

	return status;

}

void GPU::write_control(const std::unique_ptr<Vcpu>& cpu, uint8_t control)
{
	this->control = control;
	if (!(control & NMI_MASK)) cpu->nNMI = 1;
}

void GPU::write_pixel(bool high, uint8_t control)
{
	//todo: kako ovo radi?	
}

void GPU::write_line(bool high, uint8_t data)
{
	//todo: kako ovo radi?
}

void GPU::write_rect(bool high, uint8_t data)
{
	//todo: kako ovo radi?
}


