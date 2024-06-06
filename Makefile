.PHONY: run
run: build
	cmake --build build --target run

.PHONY: build
build:
	cmake -S . -B ./build -G Ninja

.PHONY: rebuild
rebuild: clear
	cmake -S . -B ./build -G Ninja

.PHONY: clear
clear:
	rm -rf build
