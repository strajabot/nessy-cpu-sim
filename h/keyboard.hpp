#include "component.hpp"

class Keyboard : public Component {
public:
    Keyboard();
    Keyboard(const Keyboard& keyboard) = delete;
    Keyboard(Keyboard&& keyboard) = delete;

    Keyboard& operator=(const Keyboard& keyboard) = delete;
    Keyboard& operator=(Keyboard&& keyboard) = delete;

    bool update(const std::unique_ptr<Vcpu>& cpu, uint64_t clock) override;
};