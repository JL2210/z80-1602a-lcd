WLA = wla-z80 -v
WLALINK = wlalink -v

main.bin: linkfile main.o lcd.o
	$(WLALINK) $< $@

%.o: %.s memorymap.i
	$(WLA) -o $@ $<

.PHONY: clean
clean:
	rm -f main.o lcd.o main.bin
