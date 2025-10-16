#include <cstdlib>
#include <bitset>
#include <iostream>

template<typename T>
void printBits(const std::string &name, T value) {
    constexpr size_t bitCount = sizeof(T) * 8;

    std::cout 
        << name << " = " 
        << std::bitset<bitCount>(static_cast<typename std::make_unsigned<T>::type>(value))
        << " (" << +value << ")" << std::endl;
}

int main() {
    unsigned char l_data1  = 1;
    unsigned char l_data2  = 255;
    unsigned char l_data3  = l_data2 + 1;
    unsigned char l_data4  = 0xA1;
    unsigned char l_data5  = 0b1001011;
    unsigned char l_data6  = 'H';
             char l_data7  = -4;
    unsigned int  l_data8  = 1u << 11;
    unsigned int  l_data9  = l_data8 << 21;
    unsigned int  l_data10 = 0xFFFFFFFF >> 5;
    unsigned int  l_data11 = 0b1001 ^ 0b01111;
    unsigned int  l_data12 = ~0b1001;
    unsigned int  l_data13 = 0xF0 & 0b1010101;
    unsigned int  l_data14 = 0b001 | 0b101;
    unsigned int  l_data15 = 7743;
             int  l_data16 = -7743;

    printBits("l_data1",  l_data1);
    printBits("l_data2",  l_data2);
    printBits("l_data3",  l_data3);
    printBits("l_data4",  l_data4);
    printBits("l_data5",  l_data5);
    printBits("l_data6",  l_data6);
    printBits("l_data7",  l_data7);
    printBits("l_data8",  l_data8);
    printBits("l_data9",  l_data9);
    printBits("l_data10", l_data10);
    printBits("l_data11", l_data11);
    printBits("l_data12", l_data12);
    printBits("l_data13", l_data13);
    printBits("l_data14", l_data14);
    printBits("l_data15", l_data15);
    printBits("l_data16", l_data16);

    return EXIT_SUCCESS;
}