#include "../h/keyboard.hpp"

Keyboard::Keyboard()
{
}

bool Keyboard::update(const std::unique_ptr<Vcpu>& cpu, uint64_t clock)
{
    static bool clFC = false;

    if (clFC)
    {
        cpu->FC = false;
        clFC = false;
    }

    if ((cpu->RD || cpu->WR) && ((cpu->A | 0x0001) == 0x4017))
    {
        // todo: hook up actual keyboard, or predefined inputs?
        if (cpu->RD)
            cpu->DIN = 0;
        cpu->FC = true;
        clFC = true;
        return true;
    }
    return false;
}