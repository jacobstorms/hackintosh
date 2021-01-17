DefinitionBlock ("", "SSDT", 2, "hack", "spoof", 0x00000000)
    {
       External (_SB_.PCI0.PEG0.PEGP, DeviceObj)    // (from opcode)

       Method (_SB.PCI0.PEG0.PEGP._DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
       {
          If (LOr (LNot (Arg2), LEqual (_OSI ("Darwin"), Zero)))
          {
             Return (Buffer (One)
             {
                0x03
             })
          }

          Return (Package (0x0A)
          {
             "name",
             Buffer (0x09)
             {
                "#display"
             },

             "IOName",
             "#display",
             "class-code",
             Buffer (0x04)
             {
                0xFF, 0xFF, 0xFF, 0xFF
             },

             "vendor-id",
             Buffer (0x04)
             {
                0xFF, 0xFF, 0x00, 0x00
             },

             "device-id",
             Buffer (0x04)
             {
                0xFF, 0xFF, 0x00, 0x00
             }
          })
       }
    }