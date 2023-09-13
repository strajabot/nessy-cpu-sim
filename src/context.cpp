#include "context.hpp"
#include <memory>

#include <Vcpu___024root.h>

uint8_t Context::getA(const std::unique_ptr<Vcpu>& cpu)
{
	return cpu->rootp->cpu__DOT__ACC;
}

uint8_t Context::getX(const std::unique_ptr<Vcpu>& cpu)
{
	return cpu->rootp->cpu__DOT__X;
}

uint8_t Context::getY(const std::unique_ptr<Vcpu>& cpu)
{
	return cpu->rootp->cpu__DOT__Y; 
}

uint8_t Context::getPSW(const std::unique_ptr<Vcpu>& cpu)
{
	return cpu->rootp->cpu__DOT__PSW;
}

uint8_t Context::getSP(const std::unique_ptr<Vcpu>& cpu)
{
	return cpu->rootp->cpu__DOT__SP;
}

uint16_t Context::getPC(const std::unique_ptr<Vcpu>& cpu)
{
	return 0;
	//return cpu->rootp->cpu__DOT__PC;
}

uint16_t Context::getMAR(const std::unique_ptr<Vcpu>& cpu)
{
	return 0;
	//return cpu->rootp->cpu__DOT__MAR;
}

uint8_t Context::getMDR(const std::unique_ptr<Vcpu>& cpu)
{
	return cpu->rootp->cpu__DOT__MDR;
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
	return cpu->rootp->cpu__DOT__IR0_;
}

void Context::save(const std::unique_ptr<Vcpu>& cpu, std::ostream& stream) 
{
	
}

