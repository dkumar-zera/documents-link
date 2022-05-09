----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:07:53 11/05/2021 
-- Design Name: 
-- Module Name:    BRAMHandler - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity BRAMHandler_CurveB_B01 is
	 Generic ( DataWidth : integer := 18);
    Port ( CLK_IN : in  STD_LOGIC;
			  ENA_IN : in STD_LOGIC;
           ADDRA_IN : in  STD_LOGIC_VECTOR(13 downto 0);
           DOA_OUT : out  STD_LOGIC_VECTOR(31 downto 0);
			  DOPA_OUT : out  STD_LOGIC_VECTOR(3 downto 0);
			  ENB_IN : in STD_LOGIC;
           ADDRB_IN : in  STD_LOGIC_VECTOR(13 downto 0);
           DIB_IN : in  STD_LOGIC_VECTOR(31 downto 0);
			  DIPB_IN : in  STD_LOGIC_VECTOR(3 downto 0));
end BRAMHandler_CurveB_B01;

architecture Behavioral of BRAMHandler_CurveB_B01 is

	signal REGCEA: STD_LOGIC := '0';
	signal RSTA: STD_LOGIC := '0';
	signal WEA : STD_LOGIC_VECTOR(3 downto 0)  := (others => '0');
	signal DIA : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	signal DIPA : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');

	signal DOB : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	signal DOPB : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
	signal REGCEB: STD_LOGIC := '0';
	signal RSTB: STD_LOGIC := '0';
	signal WEB : STD_LOGIC_VECTOR(3 downto 0) := (others => '1');
	
begin

	-- RAMB16BWER: 16k-bit Data and 2k-bit Parity Configurable Synchronous Dual Port Block RAM with Optional Output Registers
   --             Spartan-6
   -- Xilinx HDL Language Template, version 14.7

   RAMB16BWER_inst01 : RAMB16BWER
   generic map (
      -- DATA_WIDTH_A/DATA_WIDTH_B: 0, 1, 2, 4, 9, 18, or 36
      DATA_WIDTH_A => DataWidth,
      DATA_WIDTH_B => DataWidth,
      -- DOA_REG/DOB_REG: Optional output register (0 or 1)
      DOA_REG => 0,
      DOB_REG => 0,
      -- EN_RSTRAM_A/EN_RSTRAM_B: Enable/disable RST
      EN_RSTRAM_A => TRUE,
      EN_RSTRAM_B => TRUE,
     	-- INITP_00 to INITP_07: Initial memory contents.
		INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
		INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
		INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
		INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
		INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
		INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
		INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
		INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",

		-- INIT_00 to INIT_3F: Initial memory contents.
		INIT_00 => X"3FFA3FFB3FFB3FFC3FFC3FFC3FFD3FFD3FFD3FFE3FFE3FFE3FFE3FFE3FFE3FFE",
		INIT_01 => X"3FEC3FED3FEE3FEF3FF03FF13FF23FF33FF43FF53FF63FF73FF73FF83FF93FF9",
		INIT_02 => X"3FD33FD53FD73FD93FDA3FDC3FDE3FDF3FE13FE23FE43FE53FE73FE83FE93FEA",
		INIT_03 => X"3FB13FB43FB63FB93FBB3FBD3FBF3FC23FC43FC63FC83FCA3FCC3FCE3FD03FD2",
		INIT_04 => X"3F863F893F8C3F8F3F913F943F973F9A3F9D3F9F3FA23FA53FA73FAA3FAC3FAF",
		INIT_05 => X"3F503F533F573F5B3F5E3F623F653F693F6C3F6F3F733F763F793F7C3F7F3F82",
		INIT_06 => X"3F103F153F193F1D3F213F253F293F2D3F313F353F393F3D3F413F453F483F4C",
		INIT_07 => X"3EC73ECC3ED13ED63EDA3EDF3EE43EE83EED3EF23EF63EFB3EFF3F033F083F0C",
		INIT_08 => X"3E743E7A3E7F3E853E8A3E8F3E953E9A3E9F3EA43EA93EAE3EB33EB83EBD3EC2",
		INIT_09 => X"3E183E1E3E243E2A3E303E363E3C3E423E473E4D3E533E583E5E3E643E693E6F",
		INIT_0A => X"3DB23DB83DBF3DC63DCC3DD33DD93DE03DE63DEC3DF33DF93DFF3E053E0C3E12",
		INIT_0B => X"3D423D493D513D583D5F3D663D6D3D743D7B3D823D893D903D973D9E3DA43DAB",
		INIT_0C => X"3CC93CD13CD93CE13CE83CF03CF83CFF3D073D0E3D163D1D3D253D2C3D343D3B",
		INIT_0D => X"3C473C4F3C583C603C683C703C793C813C893C913C993CA13CA93CB13CB93CC1",
		INIT_0E => X"3BBB3BC43BCD3BD63BDF3BE83BF03BF93C023C0B3C133C1C3C253C2D3C363C3E",
		INIT_0F => X"3B263B303B393B433B4C3B563B5F3B683B723B7B3B843B8D3B973BA03BA93BB2",
		INIT_10 => X"3A883A923A9C3AA63AB03ABA3AC43ACE3AD83AE23AEC3AF63AFF3B093B133B1C",
		INIT_11 => X"39E139EC39F63A013A0B3A163A213A2B3A363A403A4A3A553A5F3A693A743A7E",
		INIT_12 => X"3931393C39473953395E39693974397F398A399539A039AB39B639C139CB39D6",
		INIT_13 => X"387838843890389B38A738B338BE38CA38D538E138ED38F83903390F391A3926",
		INIT_14 => X"37B637C337CF37DB37E837F43800380C381838243830383C384838543860386C",
		INIT_15 => X"36EC36F9370637133720372C373937463752375F376C377837853791379E37AA",
		INIT_16 => X"361A362736343642364F365C366A367736843691369E36AB36B836C536D236DF",
		INIT_17 => X"353F354D355A3568357635843592359F35AD35BB35C835D635E435F135FF360C",
		INIT_18 => X"345B346A34783487349534A334B234C034CE34DC34EA34F93507351535233531",
		INIT_19 => X"3370337F338E339D33AC33BB33C933D833E733F53404341334213430343E344D",
		INIT_1A => X"327D328C329C32AB32BA32CA32D932E832F83307331633253334334333523361",
		INIT_1B => X"3182319231A231B231C131D131E131F1320032103220322F323F324E325E326D",
		INIT_1C => X"307F309030A030B030C130D130E130F131023112312231323142315231623172",
		INIT_1D => X"2F752F862F972FA82FB82FC92FDA2FEB2FFB300C301C302D303D304E305E306F",
		INIT_1E => X"2E642E752E862E982EA92EBA2ECB2EDC2EED2EFE2F0F2F212F312F422F532F64",
		INIT_1F => X"2D4B2D5D2D6F2D802D922DA42DB52DC72DD82DEA2DFB2E0D2E1E2E302E412E52",
		INIT_20 => X"2C2C2C3E2C502C622C742C862C982CAA2CBC2CCE2CE02CF22D042D162D282D39",
		INIT_21 => X"2B052B182B2A2B3D2B4F2B622B742B872B992BAC2BBE2BD02BE32BF52C072C19",
		INIT_22 => X"29D829EB29FE2A112A242A372A4A2A5D2A6F2A822A952AA82ABA2ACD2AE02AF3",
		INIT_23 => X"28A528B828CB28DF28F229052919292C293F295229662979298C299F29B229C5",
		INIT_24 => X"276B277F279227A627BA27CE27E127F52808281C283028432857286A287E2891",
		INIT_25 => X"262B263F26532667267C269026A426B826CC26E026F42708271B272F27432757",
		INIT_26 => X"24E524FA250E25232537254C256025742589259D25B225C625DA25EE26032617",
		INIT_27 => X"239A23AF23C423D823ED24022417242C24402455246A247E249324A824BC24D1",
		INIT_28 => X"2249225E22732288229E22B322C822DD22F22307231C23312346235B23702385",
		INIT_29 => X"20F32108211E21332149215E21742189219E21B421C921DF21F42209221E2234",
		INIT_2A => X"1F971FAD1FC31FD91FEF2004201A20302046205B20712087209C20B220C820DD",
		INIT_2B => X"1E371E4D1E631E7A1E901EA61EBC1ED21EE81EFE1F141F2A1F401F561F6C1F82",
		INIT_2C => X"1CD21CE91CFF1D161D2C1D421D591D6F1D851D9C1DB21DC81DDE1DF51E0B1E21",
		INIT_2D => X"1B691B801B961BAD1BC41BDA1BF11C081C1E1C351C4B1C621C781C8F1CA51CBC",
		INIT_2E => X"19FC1A131A291A401A571A6E1A851A9C1AB31ACA1AE11AF71B0E1B251B3C1B52",
		INIT_2F => X"188A18A118B818D018E718FE1915192C1943195A1971198919A019B719CE19E5",
		INIT_30 => X"1715172C1744175B1772178A17A117B917D017E717FF1816182D1844185C1873",
		INIT_31 => X"159C15B415CB15E315FA1612162A1641165916701688169F16B716CE16E616FD",
		INIT_32 => X"14201438144F1467147F149714AF14C614DE14F6150E1525153D1555156D1584",
		INIT_33 => X"12A012B812D012E8130013181330134813601378139013A813C013D813F01408",
		INIT_34 => X"111E1136114F1167117F119711AF11C811E011F8121012281240125812701288",
		INIT_35 => X"0F990FB20FCA0FE20FFB1013102B1044105C1074108D10A510BD10D510EE1106",
		INIT_36 => X"0E120E2B0E430E5C0E740E8D0EA50EBE0ED60EEF0F070F1F0F380F500F690F81",
		INIT_37 => X"0C890CA10CBA0CD30CEB0D040D1D0D350D4E0D660D7F0D970DB00DC90DE10DFA",
		INIT_38 => X"0AFD0B160B2F0B480B600B790B920BAB0BC30BDC0BF50C0D0C260C3F0C570C70",
		INIT_39 => X"0970098909A209BB09D409ED0A050A1E0A370A500A690A820A9A0AB30ACC0AE5",
		INIT_3A => X"07E207FB0814082D0846085F0878089008A908C208DB08F4090D0926093F0958",
		INIT_3B => X"0652066B0684069D06B606CF06E80701071A0733074C0765077E079707B007C9",
		INIT_3C => X"04C204DB04F4050D0526053F05580571058A05A305BC05D505EE060706200639",
		INIT_3D => X"033003490362037B039503AE03C703E003F90412042B0444045D0476048F04A8",
		INIT_3E => X"019E01B701D001EA0203021C0235024E02670280029902B302CC02E502FE0317",
		INIT_3F => X"000C0025003E00570071008A00A300BC00D500EE01070121013A0153016C0185",
      -- INIT_A/INIT_B: Initial values on output port
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      -- INIT_FILE: Optional file used to specify initial RAM contents
      INIT_FILE => "NONE",
      -- RSTTYPE: "SYNC" or "ASYNC" 
      RSTTYPE => "SYNC",
      -- RST_PRIORITY_A/RST_PRIORITY_B: "CE" or "SR" 
      RST_PRIORITY_A => "CE",
      RST_PRIORITY_B => "CE",
      -- SIM_COLLISION_CHECK: Collision check enable "ALL", "WARNING_ONLY", "GENERATE_X_ONLY" or "NONE" 
      SIM_COLLISION_CHECK => "ALL",
      -- SIM_DEVICE: Must be set to "SPARTAN6" for proper simulation behavior
      SIM_DEVICE => "SPARTAN6",
      -- SRVAL_A/SRVAL_B: Set/Reset value for RAM output
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      -- WRITE_MODE_A/WRITE_MODE_B: "WRITE_FIRST", "READ_FIRST", or "NO_CHANGE" 
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "READ_FIRST" 
   )
   port map (
      -- Port A Data: 32-bit (each) output: Port A data
      DOA => DOA_OUT,       -- 32-bit output: A port data output
      DOPA => DOPA_OUT,     -- 4-bit output: A port parity output
      -- Port B Data: 32-bit (each) output: Port B data
      DOB => DOB,       -- 32-bit output: B port data output
      DOPB => DOPB,     -- 4-bit output: B port parity output
      -- Port A Address/Control Signals: 14-bit (each) input: Port A address and control signals
      ADDRA => ADDRA_IN,   -- 14-bit input: A port address input
      CLKA => CLK_IN,     -- 1-bit input: A port clock input
      ENA => ENA_IN,       -- 1-bit input: A port enable input
      REGCEA => REGCEA, -- 1-bit input: A port register clock enable input
      RSTA => RSTA,     -- 1-bit input: A port register set/reset input
      WEA => WEA,       -- 4-bit input: Port A byte-wide write enable input
      -- Port A Data: 32-bit (each) input: Port A data
      DIA => DIA,       -- 32-bit input: A port data input
      DIPA => DIPA,     -- 4-bit input: A port parity input
      -- Port B Address/Control Signals: 14-bit (each) input: Port B address and control signals
      ADDRB => ADDRB_IN,   -- 14-bit input: B port address input
      CLKB => CLK_IN,     -- 1-bit input: B port clock input
      ENB => ENB_IN,       -- 1-bit input: B port enable input
      REGCEB => REGCEB, -- 1-bit input: B port register clock enable input
      RSTB => RSTB,     -- 1-bit input: B port register set/reset input
      WEB => WEB,       -- 4-bit input: Port B byte-wide write enable input
      -- Port B Data: 32-bit (each) input: Port B data
      DIB => DIB_IN,       -- 32-bit input: B port data input
      DIPB => DIPB_IN      -- 4-bit input: B port parity input
   );

   -- End of RAMB16BWER_inst instantiation
end Behavioral;
