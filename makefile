TARGET := riscv64gc-unknown-linux-gnu
MODE := release
TARGET_DIR := ./target/$(TARGET)/$(MODE)
ELFS := $(wildcard $(TARGET_DIR)/*.so)

OBJDUMP := riscv64-unknown-linux-gnu-objdump


build: 
	@cargo build --$(MODE)
	@$(foreach elf, $(ELFS), $(OBJDUMP) -S -t $(elf) > $(patsubst $(TARGET_DIR)/%, $(TARGET_DIR)/%.asm, $(elf));)

disasm: build
	@$(foreach elf, $(ELFS), $(OBJDUMP) -S -t $(elf) > $(patsubst $(TARGET_DIR)/%, $(TARGET_DIR)/%.asm, $(elf));)

clean:
	rm -rf ./target