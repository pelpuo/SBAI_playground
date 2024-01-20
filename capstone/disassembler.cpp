#include <iostream>
#include <fstream>
#include <vector>
#include <inttypes.h>
#include <capstone/capstone.h>

using namespace std;

int main(int argc, char *argv[]) {
    // Check for the correct number of command-line arguments
    if (argc != 2) {
        cerr << "Usage: " << argv[0] << " <binary_file>" << endl;
        return -1;
    }
    
    // Initialize Capstone
    csh handle;
    if (cs_open(CS_ARCH_X86, CS_MODE_64, &handle) != CS_ERR_OK) {
        cerr << "Failed to initialize Capstone" << endl;
        return -1;
    }

    // Open the binary file
    ifstream file(argv[1], ios::binary | ios::ate);
    if (!file.is_open()) {
        cerr << "Failed to open file: " << argv[1] << endl;
        cs_close(&handle);
        return -1;
    }

    // Get the size of the file
    streamsize size = file.tellg();
    file.seekg(0, ios::beg);

    // Read the content of the file into a vector
    vector<uint8_t> buffer(static_cast<size_t>(size));
    if (!file.read(reinterpret_cast<char*>(buffer.data()), size)) {
        cerr << "Failed to read file: " << argv[1] << endl;
        file.close();
        cs_close(&handle);
        return -1;
    }

    // Disassemble the binary code
    cs_insn* insn;
    size_t count = cs_disasm(handle, buffer.data(), buffer.size(), 0x1000, 0, &insn);

    if (count > 0) {
        for (size_t i = 0; i < count; ++i) {
            printf("0x%" PRIx64 ":\t%s\t\t%s\n", insn[i].address, insn[i].mnemonic, insn[i].op_str);
        }

        // Free the allocated memory
        cs_free(insn, count);
    } else {
        cerr << "Failed to disassemble the code" << endl;
    }

    // Close Capstone
    cs_close(&handle);
    file.close();

    return 0;

}