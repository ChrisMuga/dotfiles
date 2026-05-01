#include <stdio.h>
#include <stdlib.h>

const char SET_GHOSTTY_THEME_LIGHT[] = "theme = Ayu Light";
const char SET_GHOSTTY_THEME_DARK[] = "theme = Ayu";

const char CONFIG_FILE_PATH_GHOSTTY[] = ".config/ghostty/config";
const char CONFIG_FILE_PATH_NVIM[] = "~/.config/nvim/lua/set-theme.lua";

// TODO:
//	- Find get the path of the config files, i.e:
//  		- ghostty - ~/.config/ghostty/config
//  		- nvim -> ~/.config/nvim/lua/set-theme.lua

int main(int argc, char **args) {
  printf("Your's is the world, and everything that's in it.\n");
  const char *home = getenv("HOME");

  // printf("----> %d, ^ %s", argc, args[1]);
  char theme[] = "light";

  if (home == NULL) {
    printf("Cannot access path\n");
    return 0;
  }

  char path[1000];

  sprintf(path, "%s/%s", home, CONFIG_FILE_PATH_GHOSTTY);

  FILE *fptr;

  fptr = fopen(path, "a");

  if (fptr == NULL) {
    printf("Cannot open file\n");
    return 0;
  }

  printf("----> %s\n", path);
  fprintf(fptr, SET_GHOSTTY_THEME_DARK);

  return 0;
}
