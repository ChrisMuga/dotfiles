#include <stdio.h>
#include <stdlib.h>
#include <string.h>

const char SET_GHOSTTY_THEME_LIGHT[] = "theme = Ayu Light\n";
const char SET_GHOSTTY_THEME_DARK[] = "theme = Ayu\n";

const char SET_NVIM_THEME_LIGHT[] =
    "theme = \"ayu-light\"\nvim.cmd.colorscheme(theme)\n";
const char SET_NVIM_THEME_DARK[] =
    "theme = \"ayu-dark\"\nvim.cmd.colorscheme(theme)\n";

const char CONFIG_FILE_PATH_GHOSTTY[] = ".config/ghostty/config";
const char CONFIG_FILE_PATH_NVIM[] = ".config/nvim/lua/set-theme.lua";

// TODO:
//	- Find get the path of the config files, i.e:
//  		- ghostty - ~/.config/ghostty/config
//  		- nvim -> ~/.config/nvim/lua/set-theme.lua

int main(int argc, char **args) {
  const char *home = getenv("HOME");

  char ghostty_command[100];
  char nvim_command[100];

  char mode[20] = "light";

  if (argc > 1) {
    strcpy(mode, args[1]);

    if (strcmp(mode, "dark") == 0) {
      // Set themes dark
      strcpy(ghostty_command, SET_GHOSTTY_THEME_DARK);
      strcpy(nvim_command, SET_NVIM_THEME_DARK);
    } else {
      // Set themes light
      strcpy(ghostty_command, SET_GHOSTTY_THEME_LIGHT);
      strcpy(nvim_command, SET_NVIM_THEME_LIGHT);
    }
  } else {
    // Set themes light
    strcpy(ghostty_command, SET_GHOSTTY_THEME_LIGHT);
    strcpy(nvim_command, SET_NVIM_THEME_LIGHT);
  }

  if (home == NULL) {
    printf("Cannot config files\n");
    return 0;
  }

  char ghostty_path[1000];
  char nvim_theme_path[1000];

  sprintf(ghostty_path, "%s/%s", home, CONFIG_FILE_PATH_GHOSTTY);
  sprintf(nvim_theme_path, "%s/%s", home, CONFIG_FILE_PATH_NVIM);

  // Ghostty config
  FILE *fptr_ghostty;

  fptr_ghostty = fopen(ghostty_path, "a");

  if (fptr_ghostty == NULL) {
    printf("Cannot access ghostty config file\n");
    return 0;
  }

  fprintf(fptr_ghostty, "%s", ghostty_command);

  fclose(fptr_ghostty);

  // Nvim config
  FILE *fptr_nvim;

  fptr_nvim = fopen(nvim_theme_path, "a");

  if (fptr_nvim == NULL) {
    printf("Cannot access nvim config file\n");
    return 0;
  }

  fprintf(fptr_nvim, "%s", nvim_command);

  fclose(fptr_nvim);

  printf("Theme successfully changed to %s mode. Refresh", mode);

  return 0;
}
