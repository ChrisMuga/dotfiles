build:
	@ gcc src/main.c -o bin/themes
run:
	@ ./bin/themes dark
format:
	@ clang-format --verbose -i ./src/*
test:
	@ make format build run
