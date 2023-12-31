*>******************************************************************************
*>  This file is part of cobsha3.
*>
*>  SHA3-224.cob is free software: you can redistribute it and/or 
*>  modify it under the terms of the GNU Lesser General Public License as 
*>  published by the Free Software Foundation, either version 3 of the License,
*>  or (at your option) any later version.
*>
*>  SHA3-224.cob is distributed in the hope that it will be useful, 
*>  but WITHOUT ANY WARRANTY; without even the implied warranty of 
*>  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
*>  See the GNU Lesser General Public License for more details.
*>
*>  You should have received a copy of the GNU Lesser General Public License 
*>  along with SHA3-224.cob.
*>  If not, see <http://www.gnu.org/licenses/>.
*>******************************************************************************

*>******************************************************************************
*> Program:      SHA3-224.cob
*>
*> Purpose:      This module computes SHA3-224 on the input message. 
*>
*> Author:       Laszlo Erdos - https://www.facebook.com/wortfee
*>
*> Date-Written: 2016.05.17
*>
*> Tectonics:    cobc -m -free SHA3-224.cob KECCAK.o
*>
*> Usage:        Call this module in your application.
*>
*>******************************************************************************
*> Date       Name / Change description 
*> ========== ==================================================================
*> 2016.05.17 Laszlo Erdos: 
*>            - First version created.
*>------------------------------------------------------------------------------
*> yyyy.mm.dd
*>
*>******************************************************************************


*>******************************************************************************
*> Module to compute SHA3-224 on the input message. 
*> The output length is fixed to 28 bytes.
*>******************************************************************************
 IDENTIFICATION DIVISION.
 PROGRAM-ID.. SHA3224.

 ENVIRONMENT DIVISION.

 DATA DIVISION.
 WORKING-STORAGE SECTION.
 01 LNK-KECCAK-RATE                    BINARY-LONG UNSIGNED.
 01 LNK-KECCAK-CAPACITY                BINARY-LONG UNSIGNED.
 01 LNK-KECCAK-DELIMITED-SUFFIX        PIC X.
 01 LNK-KECCAK-OUTPUT-BYTE-LEN         BINARY-DOUBLE UNSIGNED.
 
 LINKAGE SECTION.
 01 LNK-SHA3-224-INPUT                 PIC X ANY LENGTH.
 01 LNK-SHA3-224-INPUT-BYTE-LEN        BINARY-DOUBLE UNSIGNED.
 01 LNK-SHA3-224-OUTPUT                PIC X ANY LENGTH.
 
 PROCEDURE DIVISION USING LNK-SHA3-224-INPUT          
                          LNK-SHA3-224-INPUT-BYTE-LEN 
                          LNK-SHA3-224-OUTPUT.         
 
*>------------------------------------------------------------------------------
 MAIN-SHA3-224 SECTION.
*>------------------------------------------------------------------------------

    MOVE 1152  TO LNK-KECCAK-RATE
    MOVE 448   TO LNK-KECCAK-CAPACITY
    MOVE X"06" TO LNK-KECCAK-DELIMITED-SUFFIX
    MOVE 28    TO LNK-KECCAK-OUTPUT-BYTE-LEN

    CALL "KECCAK" USING LNK-KECCAK-RATE            
                        LNK-KECCAK-CAPACITY        
                        LNK-SHA3-224-INPUT           
                        LNK-SHA3-224-INPUT-BYTE-LEN  
                        LNK-KECCAK-DELIMITED-SUFFIX
                        LNK-SHA3-224-OUTPUT          
                        LNK-KECCAK-OUTPUT-BYTE-LEN 
    END-CALL
    
    GOBACK
    
    .
 MAIN-SHA3-224-EX.
    EXIT.
 END PROGRAM SHA3_224.
