.DEFAULT_GOAL := summary

CLEAN_TARGETS += $(ALL_LIBRARIES)

ifeq ($(strip $(ROOTTEST_HOME)),)
	export ROOTTEST_HOME:=$(CURDIR)/
   ifeq ($(strip $(ROOTTEST_HOME)),)
      export ROOTTEST_HOME := $(shell git rev-parse --show-toplevel)/
   endif
   ifeq ($(strip $(ROOTTEST_HOME)),)
      $(error The head of roottest was not found.  Set ROOTTEST_HOME)
   endif
endif

include $(ROOTTEST_HOME)/scripts/Rules.mk

clingtest: test

