#include "context.hpp"

#include <fstream>
#include <format>
#include <memory>

uint8_t Context::getACC(const std::unique_ptr<Vcpu>& cpu)
{
	return cpu->ACC;
}

uint8_t Context::getX(const std::unique_ptr<Vcpu>& cpu)
{
	return cpu->X;
}

uint8_t Context::getY(const std::unique_ptr<Vcpu>& cpu)
{
	return cpu->Y; 
}

uint8_t Context::getPSW(const std::unique_ptr<Vcpu>& cpu)
{
	return cpu->PSW;
}

uint8_t Context::getSP(const std::unique_ptr<Vcpu>& cpu)
{
	return cpu->SP;
}

uint16_t Context::getPC(const std::unique_ptr<Vcpu>& cpu)
{
	return cpu->PC;
}

uint16_t Context::getMAR(const std::unique_ptr<Vcpu>& cpu)
{
	return cpu->MAR;
}

uint8_t Context::getMDR(const std::unique_ptr<Vcpu>& cpu)
{
	return cpu->MDR;
}

uint8_t Context::getIR0(const std::unique_ptr<Vcpu>& cpu)
{
	return cpu->IR0_;
}

uint8_t Context::getIRDATA(const std::unique_ptr<Vcpu>& cpu)
{
	return cpu->IRDATA;
}

uint16_t Context::getIRADDR(const std::unique_ptr<Vcpu>& cpu)
{
	return cpu->IRADDR;
}

void Context::dump(const std::unique_ptr<Vcpu>& cpu) 
{
	std::ofstream output_reg("bin/output_reg.dump");
	
	output_reg << "ACC		= " << std::format("{:#04x}", getACC(cpu)) << std::endl;
	output_reg << "X		= " << std::format("{:#04x}", getX(cpu)) << std::endl;
	output_reg << "Y		= " << std::format("{:#04x}", getY(cpu)) << std::endl;
	output_reg << "PSW		= " << std::format("{:#04x}", getPSW(cpu)) << std::endl;
	output_reg << "SP		= " << std::format("{:#04x}", getSP(cpu)) << std::endl;
	output_reg << "PC		= " << std::format("{:#06x}", getPC(cpu)) << std::endl;
	output_reg << "MAR		= " << std::format("{:#06x}", getMAR(cpu)) << std::endl;
	output_reg << "MDR		= " << std::format("{:#04x}", getMDR(cpu)) << std::endl;
	output_reg << "IR0		= " << std::format("{:#04x}", getIR0(cpu)) << std::endl;
	output_reg << "IRDATA	= " << std::format("{:#04x}", getIRDATA(cpu)) << std::endl;
	output_reg << "IRADDR	= " << std::format("{:#06x}", getIRADDR(cpu)) << std::endl;


}

