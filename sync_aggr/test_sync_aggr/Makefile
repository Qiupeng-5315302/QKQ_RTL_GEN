# =============================================================================
# Makefile for VCS Compilation of as6d_app RTL
# =============================================================================

# Project directories
SYNC_AGGR_ROOT = /home/yian/project_autotest/QKQ_RTL_GEN/sync_aggr
RTL_FILE = rtl.f

# Simulation directories
SIM_DIR = sim
WORK_DIR = $(SIM_DIR)/work

# VCS options (same as timestamp_align_tb)
VCS = vcs
VCS_FLAGS = -full64 \
            -sverilog \
            +v2k \
            -timescale=1ns/1ps \
            -debug_access+all \
            -kdb \
            -lca \
            -ntb_opts dtm \
            -P $(VERDI_HOME)/share/PLI/VCS/LINUX64/novas.tab \
            $(VERDI_HOME)/share/PLI/VCS/LINUX64/pli.a \
            +incdir+$(SYNC_AGGR_ROOT)/AS6D_APP \
            +incdir+$(SYNC_AGGR_ROOT)/AS6T28_COMRTL

# Compilation log
COMPILE_LOG = compile.log

# Executable
SIMV = $(SIM_DIR)/simv

# =============================================================================
# Targets
# =============================================================================

.PHONY: all clean compile recompile check help

# Default target
all: check compile

# Help information
help:
	@echo "=========================================="
	@echo "  Makefile for as6d_app RTL Compilation"
	@echo "=========================================="
	@echo "Project: $(SYNC_AGGR_ROOT)"
	@echo "RTL file: $(RTL_FILE)"
	@echo ""
	@echo "Targets:"
	@echo "  make compile    - Compile RTL (always full recompile)"
	@echo "  make recompile  - Clean and recompile"
	@echo "  make check      - Check file list and paths"
	@echo "  make clean      - Clean all generated files"
	@echo "  make help       - Show this help message"
	@echo "=========================================="

# Check file existence
check:
	@echo "=========================================="
	@echo "  Checking RTL Setup..."
	@echo "=========================================="
	@echo "SYNC_AGGR_ROOT: $(SYNC_AGGR_ROOT)"
	@echo "RTL File: $(RTL_FILE)"
	@if [ -f $(RTL_FILE) ]; then \
		echo "✓ RTL file found"; \
	else \
		echo "✗ RTL file not found"; \
		exit 1; \
	fi
	@echo ""
	@echo "Checking RTL files listed in $(RTL_FILE)..."
	@file_count=$$(sed "s|\$${SYNC_AGGR_ROOT}|$(SYNC_AGGR_ROOT)|g" $(RTL_FILE) | grep "\.v$$" | wc -l); \
	echo "Total RTL files: $$file_count"
	@echo "=========================================="
	@echo ""

# Create simulation directory
$(SIM_DIR):
	@mkdir -p $(SIM_DIR)

# Compile with VCS (always recompile to ensure up-to-date)
compile: $(SIM_DIR)
	@echo "=========================================="
	@echo "  Compiling with VCS..."
	@echo "=========================================="
	@echo "SYNC_AGGR_ROOT = $(SYNC_AGGR_ROOT)"
	@echo ""
	cd $(SIM_DIR) && SYNC_AGGR_ROOT=$(SYNC_AGGR_ROOT) $(VCS) $(VCS_FLAGS) -o simv \
		$$(sed "s|\$${SYNC_AGGR_ROOT}|$(SYNC_AGGR_ROOT)|g" ../$(RTL_FILE) | grep -v "^//" | grep -v "^$$" | grep "\.v$$")
	@echo ""
	@echo "Compilation completed successfully!"
	@echo "Executable: $(SIMV)"
	@echo ""

# Force recompilation (same as compile now)
recompile: clean compile

# Clean generated files
clean:
	@echo "Cleaning generated files..."
	rm -rf $(SIM_DIR)
	rm -rf csrc
	rm -rf DVEfiles
	rm -rf verdiLog
	rm -rf novas*
	rm -rf *.log
	rm -rf *.vpd
	rm -rf ucli.key
	rm -rf vc_hdrs.h
	rm -rf AN.DB
	rm -rf work
	rm -rf .vlogansetup.args
	rm -rf .vcs*
	@echo "Clean completed!"
