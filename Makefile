BUILD_DIR=build

.PHONY: all clean

all:
	mkdir -p $(BUILD_DIR)
	cmake -S . -B $(BUILD_DIR) -DCMAKE_BUILD_TYPE=Release -G Ninja
	cmake --build $(BUILD_DIR)

clean:
	rm -rf $(BUILD_DIR)
