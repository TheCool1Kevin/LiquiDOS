# @Author: Kevin Dai
# @Date:   2017-07-29T14:30:45-04:00
# @Email:  kevindai02@outlook.com
# @Filename: Makefile.in
# @Last modified by:   Kevin Dai
# @Last modified time: 2017-11-22T22:04:54-05:00



TARGET_FOLDER=x86

.PHONY: all
all:
	@echo "\n\033[1;36m[Building C and C++ sources]\033[0m"
	@cd kernelsrc && make --no-print-directory
	@cd obj && make --no-print-directory
ifeq ($(TARGET_FOLDER),x86)
	@cd grub && make --no-print-directory
endif
	@echo "\033[1;32m-------------- Done! --------------\033[0m"
	@echo "\033[1;36mBuild is done. Go give yourself a pat on the back.\033[0m"

.PHONY: cleanall
cleanall:
	@cd kernelsrc && make clean --no-print-directory
	@echo "\033[1;36m[Removing autohell generated objects]\033[0m"
	@rm -rf kernelsrc/Makefile grub/Makefile obj/Makefile config.status config.log
	@echo "\033[1;36m[Commiting suicide]\033[0m"
	@rm -rf kernelsrc/include/autoconf.h kernelsrc/include/autoarch.h
	@rm -rf Makefile

.PHONY: clean
clean:
	@cd kernelsrc && make clean --no-print-directory
	@echo "\033[1;36m[Removing autohell generated objects]\033[0m"
	@rm -rf config.status config.log