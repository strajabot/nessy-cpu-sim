#include "context.hpp"
#include <memory>

#include <Vcpu___024root.h>

uint8_t Context::getA(const std::unique_ptr<Vcpu>& cpu)
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

uint8_t Context::getTMP(const std::unique_ptr<Vcpu>& cpu)
{
	return cpu->rootp->cpu__DOT__TMP;
}

uint8_t Context::getIRQFF(const std::unique_ptr<Vcpu>& cpu)
{
	return 0;
}

uint8_t Context::getNMIFF(const std::unique_ptr<Vcpu>& cpu)
{
	return 0;
}

uint8_t Context::getIR0(const std::unique_ptr<Vcpu>& cpu)
{
	return cpu->IR0_;
}

void Context::save(const std::unique_ptr<Vcpu>& cpu, std::ostream& stream) 
{
	
}

