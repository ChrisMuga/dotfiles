#include <stdio.h>
#include <stdlib.h>
#include <string.h>

const char LIGHT_THEME_GHOSTTY[] = "Ayu Light";
const char DARK_THEME_GHOSTTY[] = "Ayu";

const char CONFIG_FILE_PATH_GHOSTTY[] = ".config/ghostty/config";
const char CONFIG_FILE_PATH_NVIM[] = "~/.config/nvim/lua/set-theme.lua";

// TODO:
//	- Find get the path of the config files, i.e:
//  		- ghostty - ~/.config/ghostty/config
//  		- nvim -> ~/.config/nvim/lua/set-theme.lua

int main() {
  printf("Your's is the world, and everything that's in it.\n");
  const char *home = getenv("HOME");

  if (home == NULL) {
    printf("Cannot access path\n");
    return 0;
  }

  char path[1000] = "";

  strcat(path, home);
  strcat(path, "/");
  strcat(path, CONFIG_FILE_PATH_GHOSTTY);

  printf("----> %s\n", path);

  FILE *fptr;

  fptr = fopen(path, "r");

  if (fptr == NULL) {
    printf("Cannot open file\n");
  }

  return 0;
}
