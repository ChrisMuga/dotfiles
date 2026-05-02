build:
	@ gcc src/main.c -o bin/theme
run:
	@ ./bin/themes dark
format:
	@ clang-format --verbose -i ./src/*
test:
	@ make format build run
deploy:
	@ make build --silent
	@ sudo mv bin/theme /usr/local/bin/theme
	@ echo Deploy successful
