#ifndef COMPONENT_HPP
#define COMPONENT_HPP

#include <memory>
#include <cstdint>

#include "Vcpu.h"

class Component {

public:
	virtual bool update(const std::unique_ptr<Vcpu>& cpu, uint64_t clock) = 0; 

};

#endif // !COMPONENT_HPP
