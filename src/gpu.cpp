#include "gpu.hpp"

#include <cstdint>
#include <algorithm>
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
	{		
		switch (address)
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
	static const constexpr uint32_t nmi_freq = 1040*665;

	if(clock % (nmi_freq) == 0)
	{
		cpu->nNMI = !(control & NMI_MASK);
		printf("[%zu] SET nNMI: %d\n", clock, cpu->nNMI);
	}
	if ((clock - 1040*64) % (nmi_freq) == 0)
		cpu->nNMI = 1;
}

void GPU::update_gpu(const std::unique_ptr<Vcpu>& cpu, uint64_t address, uint64_t clock)
{
	for (bool high = false; high != true; high = true)
	{
		if (pixel_ticks[high])
		{
			pixel_ticks[high]--;
			if (pixel_ticks[high] == 0)
			{
				uint16_t x = pixel_data[3][high] + (pixel_data[4][high] << 8);
				uint16_t y = pixel_data[5][high] + (pixel_data[6][high] << 8);
				uint8_t r = pixel_data[0][high] << 4;
				uint8_t g = pixel_data[1][high] << 4;
				uint8_t b = pixel_data[2][high] << 4;
				pixel_idx[high] = 0;
			}
		}
	}
	for (bool high = false; high != true; high = true)
	{
		if (line_ticks[high])
		{
			line_ticks[high]--;
			if (line_ticks[high] == 0)
			{
				uint16_t x1 = line_data[3][high] + (line_data[4][high] << 8);
				uint16_t y1 = line_data[5][high] + (line_data[6][high] << 8);
				uint16_t x2 = line_data[7][high] + (line_data[8][high] << 8);
				uint16_t y2 = line_data[9][high] + (line_data[10][high] << 8);
				uint8_t r = line_data[0][high] << 4;
				uint8_t g = line_data[1][high] << 4;
				uint8_t b = line_data[2][high] << 4;
				line_idx[high] = 0;
			}
		}
	}
	for (bool high = false; high != true;  high = true)
	{
		if (rect_ticks[high])
		{
			rect_ticks[high]--;
			if (rect_ticks[high] == 0)
			{
				uint16_t x1 = rect_data[3][high] + (rect_data[4][high] << 8);
				uint16_t y1 = rect_data[5][high] + (rect_data[6][high] << 8);
				uint16_t x2 = rect_data[7][high] + (rect_data[8][high] << 8);
				uint16_t y2 = rect_data[9][high] + (rect_data[10][high] << 8);
				uint8_t r = rect_data[0][high] << 4;
				uint8_t g = rect_data[1][high] << 4;
				uint8_t b = rect_data[2][high] << 4;
				rect_idx[high] = 0;
			}
		}
	}
}

uint8_t GPU::read_status()
{
	uint8_t status = 0;
	
	status |= !rect_idx[1]; status <<= 1;
	status |= !rect_idx[0]; status <<= 1;
	status |= !line_idx[1]; status <<= 1;
	status |= !line_idx[0]; status <<= 1;
	status |= !pixel_idx[1]; status <<= 1;
	status |= !pixel_idx[0]; status <<= 1;

	return status;

}

void GPU::write_control(const std::unique_ptr<Vcpu>& cpu, uint8_t control)
{
	this->control = control;
	if (!(control & NMI_MASK)) cpu->nNMI = 1;
}

void GPU::write_pixel(bool high, uint8_t data)
{
	pixel_data[pixel_idx[high]++][high] = data;
	if (pixel_idx[high] == 5)
		pixel_ticks[high] = 1;
}

void GPU::write_line(bool high, uint8_t data)
{
	line_data[line_idx[high]++][high] = data;
	if (line_idx[high] == 7)
	{
		uint16_t x1 = line_data[3][high] + (line_data[4][high] << 8);
		uint16_t y1 = line_data[5][high] + (line_data[6][high] << 8);
		uint16_t x2 = line_data[7][high] + (line_data[8][high] << 8);
		uint16_t y2 = line_data[9][high] + (line_data[10][high] << 8);
		line_ticks[high] = std::max(std::abs(x2 - x1) + 1, std::abs(y2 - y1) + 1);
	}
}

void GPU::write_rect(bool high, uint8_t data)
{
	rect_data[rect_idx[high]++][high] = data;
	if (rect_idx[high] == 7)
	{
		uint16_t x1 = rect_data[3][high] + (rect_data[4][high] << 8);
		uint16_t y1 = rect_data[5][high] + (rect_data[6][high] << 8);
		uint16_t x2 = rect_data[7][high] + (rect_data[8][high] << 8);
		uint16_t y2 = rect_data[9][high] + (rect_data[10][high] << 8);
		rect_ticks[high] = (abs(y2-y1) + 1) * (abs(x2-x1) + 1);
	}
}


