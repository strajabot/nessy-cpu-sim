#ifndef GPU_H
#define GPU_H

#include "component.hpp"
#include <cstdint>

class GPU: public Component {
public:
	GPU();
	GPU(const GPU& gpu) = delete;
	GPU(GPU&& gpu) = delete;

	GPU& operator=(const GPU& gpu) = delete;
	GPU& operator=(GPU&& gpu) = delete;

	bool update(const std::unique_ptr<Vcpu>& cpu, uint64_t clock) override;

private:
	enum MAP_REGISTER {
		GPU_STATUS = 0,
		GPU_CONTROL = 0,
		PIXEL_LOW,
		PIXEL_HIGH,
		LINE_LOW,
		LINE_HIGH,
		RECT_LOW,
		RECT_HIGH
	};

	static const constexpr uint16_t reg_map[] = {
		0x2000,
		0x2001,
		0x2002,
		0x2003,
		0x2004,
		0x2005,
		0x2006,
	};


	static const constexpr uint8_t NMI_MASK = 0x80;

	uint8_t control;

	bool clFC = false;

	uint8_t rect_data[7][2] = {};
	uint8_t line_data[7][2] = {};
	uint8_t pixel_data[5][2] = {};

	uint8_t rect_idx[2] = {};
	uint8_t line_idx[2] = {};
	uint8_t pixel_idx[2] = {};


	void update_nmi(const std::unique_ptr<Vcpu>& cpu, uint64_t clock);
	void update_gpu(const std::unique_ptr<Vcpu>& cpu, uint64_t address, uint64_t clock);

	uint8_t read_status();
	void write_control(const std::unique_ptr<Vcpu>& cpu, uint8_t control);
	void write_pixel(bool high, uint8_t data);
	void write_line(bool high, uint8_t data);
	void write_rect(bool high, uint8_t data);



};

#endif //!GPU_H
