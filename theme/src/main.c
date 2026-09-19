#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MODE_LIGHT "light"
#define MODE_DARK "dark"
#define MODE_ROSE "rose"
#define MODE_ROSY "rosy"
#define MODE_ALT "alt"
#define MODE_NIGHT "night"
#define MODE_RESET "reset"

const char SET_GHOSTTY_THEME_LIGHT[] = "theme = Ayu Light\n";
const char SET_GHOSTTY_THEME_DARK[] = "theme = Ayu\n";
const char SET_GHOSTTY_THEME_ALT[] = "theme = Gruvbox Dark\n";
const char SET_GHOSTTY_THEME_NIGHT[] = "theme = Night Owl\n";
const char SET_GHOSTTY_THEME_ROSE[] = "theme = Rose Pine\n";
const char SET_GHOSTTY_THEME_ROSY[] = "theme = Rose Pine Dawn\n";

const char SET_NVIM_THEME_LIGHT[] = "vim.cmd.colorscheme(\'ayu-light\')\n";
const char SET_NVIM_THEME_DARK[] = "vim.cmd.colorscheme(\'ayu-dark\')\n";
const char SET_NVIM_THEME_ALT[] =
    "vim.cmd.set(\'background=dark\')\nvim.cmd.colorscheme(\'gruvbox\')\n";
const char SET_NVIM_THEME_NIGHT[] =
    "vim.cmd.set(\'background=dark\')\nvim.cmd.colorscheme(\'night-owl\')\n";
const char SET_NVIM_THEME_ROSE[] = "vim.cmd.colorscheme(\'rose-pine-main\')\n";
const char SET_NVIM_THEME_ROSY[] = "vim.cmd.colorscheme(\'rose-pine-dawn\')\n";

const char CONFIG_FILE_PATH_GHOSTTY[] = ".config/ghostty/config";
const char CONFIG_FILE_PATH_NVIM[] = ".config/nvim/lua/set-theme.lua";

// NOTE:
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
    if (strcmp(mode, MODE_LIGHT) != 0 && strcmp(mode, MODE_DARK) != 0 &&
        strcmp(mode, MODE_ALT) != 0 && strcmp(mode, MODE_ROSE) != 0 &&
		strcmp(mode, MODE_NIGHT) != 0 &&
        strcmp(mode, MODE_ROSY) != 0 && strcmp(mode, MODE_RESET) != 0) {
      printf("\"%s\" is not an acceptable theme, expected values dark | light "
             "| alt | rose | rosy | night\n Use reset to reset the toolchain",
             mode);
      return 0;
    }

    if (strcmp(mode, MODE_DARK) == 0) {
      strcpy(ghostty_command, SET_GHOSTTY_THEME_DARK);
      strcpy(nvim_command, SET_NVIM_THEME_DARK);
    } else if (strcmp(mode, MODE_ALT) == 0) {
      strcpy(ghostty_command, SET_GHOSTTY_THEME_ALT);
      strcpy(nvim_command, SET_NVIM_THEME_ALT);
    } else if (strcmp(mode, MODE_NIGHT) == 0) {
      strcpy(ghostty_command, SET_GHOSTTY_THEME_NIGHT);
      strcpy(nvim_command, SET_NVIM_THEME_NIGHT);
    } else if (strcmp(mode, MODE_ROSE) == 0) {
      strcpy(ghostty_command, SET_GHOSTTY_THEME_ROSE);
      strcpy(nvim_command, SET_NVIM_THEME_ROSE);
    } else if (strcmp(mode, MODE_ROSY) == 0) {
      strcpy(ghostty_command, SET_GHOSTTY_THEME_ROSY);
      strcpy(nvim_command, SET_NVIM_THEME_ROSY);
    } else if (strcmp(mode, MODE_RESET) == 0) {
      printf("Resetting toolchain(s)\n");
      int status = system("bash -c 'cd ~/dotfiles; git pull; make'");
      if (status == -1) {
        printf("Reset FAILED\n");
      }
      return 0;
    } else {
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

  printf("Theme successfully changed to %s mode. Refresh\n", mode);

  return 0;
}
