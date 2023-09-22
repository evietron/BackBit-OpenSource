# BackBit-MemoryExpansion

These are some memory expansions that I use for my own machines. Feel free to make your own builds, modifications, or to ask me questions about how to build.

## Atari-520ST-4MB

- Details: Expands 520ST or 1040ST to maxmimum 4MB RAM.
- BOM: 2x SMT MSM5118165F-50TK, 2x SMT 0.1uF ceramic capacitors, 1x 33Ω THT resistor, 2x 66Ω THT resistor, round header pins, 16x 16P 0.3" sockets, 4x bodge wires.
- Installation: Mount sockets on main board, route bodge wires, drop memory board into sockets.

## IBM-PCjr-512KB

- Details: Adds 512KB, expanding total system memory to 640KB (if you already have 128KB internally).
- BOM: 1x THT AS6C4008-55PCN/PIN, 2x THT 0.1uF ceramic capacitors, 1x THT 10uF electrolytic capacitor, 1x THT 74LS151 logic chip, 2x30P 2.54mm female header.
- Installation: Plug into side of machine.

## Tandy-CoCo3-512KB

- Details: Expands base model's 128KB to 512KB. Timing window is very narrow. RC delay accomodates SRAM to work in place of DRAM.
- BOM: 1x SMT IS61C25616AS-25TLI, 1x SMT ATF1502ASL-25AU44, square header pins.
- Installation: Program CPLD w/ ATDH1150USB programmer. Remove existing RAM chips, attach square pin headers, drop into expansion headers. Optionally remove ceramic caps C65 and C66.

## TexasInstruments-TI994A-32KB

- Details: Fills in the system's memory map to get the maximum non-bankswitched RAM expansion. No pass-through port in this design. Need to add JTAG header if you don't have a programmer with a socket.
- BOM: 1x SMT CY62256NLL-70, 1x SMT ATF1502ASL-25AU44, 5x SMT 0.1uF bypass capacitors, 44P 2.54mm edge connector.
- Installation: Program CPLD w/ ATDH1150USB programmer. Attach edge connector.
