#include <memory>

#include <Vcpu.h>


class Context {
public:

	static uint8_t  getACC(const std::unique_ptr<Vcpu>& cpu);
	static uint8_t  getX(const std::unique_ptr<Vcpu>& cpu);
	static uint8_t  getY(const std::unique_ptr<Vcpu>& cpu);
	static uint8_t  getPSW(const std::unique_ptr<Vcpu>& cpu);
	static uint8_t  getSP(const std::unique_ptr<Vcpu>& cpu);
	static uint16_t getPC(const std::unique_ptr<Vcpu>& cpu);
	static uint16_t getMAR(const std::unique_ptr<Vcpu>& cpu);
	static uint8_t  getMDR(const std::unique_ptr<Vcpu>& cpu);
	static uint8_t	getIR0(const std::unique_ptr<Vcpu>& cpu);
	static uint8_t	getIRDATA(const std::unique_ptr<Vcpu>& cpu);
	static uint16_t	getIRADDR(const std::unique_ptr<Vcpu>& cpu);
	
	static void dump(const std::unique_ptr<Vcpu>& cpu);

};

