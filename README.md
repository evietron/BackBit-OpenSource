# Open Source Hardware for Vintage Computers
## Developed by BackBit (http://backbit.io)

These are some hardware devices that I use for my vintage machines. I used to sell some of these, but I no longer have the bandwidth to build these specfic items so I have made the designs open-source. Designs may have been derived from various information I scrubbed from the internet, but layouts are my own. Feel free to make your own builds, modifications, or to ask me questions about how to build.

## Atari 520ST/1040ST (4MB internal upgrade)
![atari](https://github.com/evietron/BackBit-OpenSource/assets/35610816/f5d18e29-09bc-4446-92b1-2fdf34975245)
- Details: Expands 520ST or 1040ST to maxmimum 4MB RAM.
- BOM: 2x SMT MSM5118165F-50TK, 2x SMT 0.1uF ceramic capacitors, 1x 33Ω THT resistor, 2x 66Ω THT resistor, round header pins, 16x 16P 0.3" sockets, 4x bodge wires.
- Installation: Mount sockets on main board, route bodge wires. Plug memory board into sockets.

## Commodore 64/128 Diagnostic Harness: Keyboard Loopback for 128/128D/SX64
![dongle](https://github.com/evietron/BackBit-OpenSource/assets/35610816/0ff5ee9e-ce08-46f5-bf3d-5d8ec9489b38)
- Details: Provides a keyboard loopback for C128, C128D, and SX64 machines to peform full diagnostic tests
- Note: there are two ways to build --- a reversible C128/C128D loopback, and a SX64 loopback.
- BOM (128/128D): DB25 - male & female connectors (with screws removed), 1x #6x1/2" brass screw, E-Switch LC2259EENP DPDT switch, E-Switch 1SBLK switch cap
- BOM (SX64): DB25 - male connector with cover removed
- Instructions (128/128D): Print Keyboard128 case. Solder DB25 male connector to "DB25-M(8)" side and DB25 female connector to "DB25-M(X)/F(8)" side. Solder DPDT switch. 
- Instructions (SX64): Print KeyboardSX case. Solder "SX64 enable" blob. Solder DB25 male connector (w/ cover removed) to "DB25-M(X)/F(8)" side. Attach to case with super glue, with 13-pin side closer to handle, 12-pin side away from handle.
 
## IBM PCjr (512KB sidecar expansion)
![pcjr](https://github.com/evietron/BackBit-OpenSource/assets/35610816/a76c975b-dd6d-4008-a9ed-c999b2c15e44)
- Details: Adds 512KB, expanding total system memory to 640KB (if you already have 128KB internally).
- BOM: 1x THT AS6C4008-55PCN/PIN, 2x THT 0.1uF ceramic capacitors, 1x THT 10uF electrolytic capacitor, 1x THT 74LS151 logic chip, 2x30P 2.54mm female header.
- Installation: Plug sidecar into side of machine.

## PLAster 128 (PLA replacement for Commodore 128)
![plaster128](https://github.com/evietron/BackBit-OpenSource/assets/35610816/7ebf0da7-4511-4e17-847f-dc302badc5b8)
- Details: Replaces MOS 8721 with exact equations used in original device
- Compatibility Mode: Switch allows cartridges to work in FAST mode.
- KERNAL Mode: Switch allows BackBit cartridge (any maybe others) to replace KERNAL ROM.
- Private Eyes Mode: Switch sets bug high to facilitate in-circuit testing.
- BOM: XC9572XL-*VQG64C, 3x 2.54mm DIP switch, 48x header pins, optional 48P socket.
- Instructions: PCB requires SMT assembly.

## Tandy Color Computer 3 (512KB internal upgrade)
![tandy](https://github.com/evietron/BackBit-OpenSource/assets/35610816/564bc779-8421-4ecd-83f1-d87a8843ee1d)
- Details: Expands base model's 128KB to 512KB. Timing window is very narrow. RC delay accomodates SRAM to work in place of DRAM.
- BOM: 1x SMT IS61C25616AS-25TLI, 1x SMT ATF1502ASL-25AU44, square header pins.
- Installation: Program CPLD w/ ATDH1150USB programmer. Remove existing RAM chips, plug memory board into expansion headers. Optionally remove ceramic caps C65 and C66.

## Texas Instruments TI-99/4A (32KB sidecar expansion)
![ti99](https://github.com/evietron/BackBit-OpenSource/assets/35610816/79d055d7-3faf-4f9b-b9ff-c5828c904c9f)
- Details: Fills in the system's memory map to get the maximum non-bankswitched RAM expansion. No pass-through port in this design. Need to add JTAG header if you don't have a programmer with a socket.
- BOM: 1x SMT CY62256NLL-70SNX (SOP-28), 1x SMT ATF1502ASL-25AU44, 5x SMT 0.1uF bypass capacitors, 44P 2.54mm edge connector.
- Installation: Program CPLD w/ ATDH1150USB programmer. Plug sidecar into side of machine.
- Case: https://www.printables.com/model/301498
