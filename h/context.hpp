#include <memory>

#include <Vcpu.h>


class Context {
public:

	static uint8_t  getA(const std::unique_ptr<Vcpu>& cpu);
	static uint8_t  getX(const std::unique_ptr<Vcpu>& cpu);
	static uint8_t  getY(const std::unique_ptr<Vcpu>& cpu);
	static uint8_t  getPSW(const std::unique_ptr<Vcpu>& cpu);
	static uint8_t  getSP(const std::unique_ptr<Vcpu>& cpu);
	static uint16_t getPC(const std::unique_ptr<Vcpu>& cpu);
	static uint16_t getMAR(const std::unique_ptr<Vcpu>& cpu);
	static uint8_t  getMDR(const std::unique_ptr<Vcpu>& cpu);
	static uint8_t  getTMP(const std::unique_ptr<Vcpu>& cpu);
	static uint8_t  getIRQFF(const std::unique_ptr<Vcpu>& cpu);
	static uint8_t  getNMIFF(const std::unique_ptr<Vcpu>& cpu);
	static uint8_t *getIR(const std::unique_ptr<Vcpu>& cpu);

	static void     save(const std::unique_ptr<Vcpu>& cpu,  std::ostream& stream);

};

