 .db "NES", $1a	;identification	of the iNES header
 .db $08 ;number of 16KB PRG-ROM pages
 .db $00 ;number of 8KB	CHR-ROM	pages
 .db $21 ;mapper 2 and mirroring
 .dsb 9, $00 ;clear the	remaining bytes