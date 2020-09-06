# popsrc
NES Prince of Persia Source code

This is a source code of NES Prince of Persia (U locale).  
Note that original compiler uses 16bit instructions for zero-pages variables (STA $XXXX instead of STA $XX) sometimes, so you will see strange hardcodes instead of real instructions. Like this:  
`;		STA	vtmpCounter19`  
`		.BYTE	$8D, $19, $00`
    
But correct instruction is:  
`.BYTE $8D, <(vtmpCounter19), >(vtmpCounter19)`
