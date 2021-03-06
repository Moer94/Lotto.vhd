library ieee;
use ieee.std_logic_1164.all;

entity e_7seg_display is
    port(	sl_resetn, sl_start  : in std_logic;
            sl_won, sl_clock     : in std_logic;
            slv_index            : in std_logic_vector(2 downto 0);
            slv_whole_lotteryinput: in std_logic_vector(0 to 19);
            slv_7seg             : out std_logic_vector(0 to 41) 	);
end entity e_7seg_display;

architecture a_hex7seg of e_7seg_display is

-- Declarations:
signal slv_7seg_int: std_logic_vector(0 to 41);
-- Constant Declarations:
	constant c_0:		std_logic_vector := "0000001";
	constant c_1:		std_logic_vector := "1001111";
	constant c_2:		std_logic_vector := "0010010";
	constant c_3:		std_logic_vector := "0000110";
	constant c_4:		std_logic_vector := "1001100";
	constant c_5:		std_logic_vector := "0100100";
	constant c_6:		std_logic_vector := "0100000";
	constant c_7:		std_logic_vector := "0001111";
	constant c_8:		std_logic_vector := "0000000";
	constant c_9:		std_logic_vector := "0000100";
	constant c_a:		std_logic_vector := "0000010";
	constant c_E:		std_logic_vector := "0110000";
	constant c_H:		std_logic_vector := "1001000";
	constant c_I:		std_logic_vector := "1111001";
	constant c_L:		std_logic_vector := "1110001";
	constant c_n:		std_logic_vector := "1101010";
	constant c_O:		std_logic_vector := "0000001";
	constant c_P:		std_logic_vector := "0011000";
	constant c_r:		std_logic_vector := "1111010";
	constant c_S:		std_logic_vector := "0100100";
	constant c_t:		std_logic_vector := "1110000";
	constant c_U:		std_logic_vector := "1000001";
	constant c_y:		std_logic_vector := "1000100";
	constant c_dash:	std_logic_vector := "1111110";
	constant c_blank:	std_logic_vector := "1111111";

begin

-- Assignments:

   --
   --       0  
   --      ---  
   --     |   |
   --    5|   |1
   --     | 6 |
   --      ---  
   --     |   |
   --    4|   |2
   --     |   |
   --      ---  
   --       3  
   --
   p_message_display: process (sl_resetn, sl_start, sl_clock, sl_won, slv_index,slv_whole_lotteryinput)
   begin
				if(sl_start = '1') then
							case slv_index is
							when "000" =>
								 slv_7seg_int(0 to 6)  <= c_I; 
								 slv_7seg_int(7 to 13)  <= c_n; 
								 slv_7seg_int(14 to 20)  <= c_P; 
								 slv_7seg_int(21 to 27)   <= c_U; 
								 slv_7seg_int(28 to 34)   <= c_t; 
								 slv_7seg_int(35 to 41)    <= c_blank;
							when "110" =>
								 if(sl_won = '1') then
									  slv_7seg_int(0 to 6)  <= c_blank; 
									  slv_7seg_int(7 to 13)  <= c_y; 
									  slv_7seg_int(14 to 20)  <= c_E; 
									  slv_7seg_int(21 to 27)   <= c_a; 
									  slv_7seg_int(28 to 34)   <= c_H; 
									  slv_7seg_int(35 to 41)    <= c_blank;
								 elsif sl_won = '0' then
									  slv_7seg_int(0 to 6)  <= c_blank; 
									  slv_7seg_int(7 to 13)  <= c_L; 
									  slv_7seg_int(14 to 20)  <= c_O; 
									  slv_7seg_int(21 to 27)   <= c_S; 
									  slv_7seg_int(28 to 34)   <= c_t; 
									  slv_7seg_int(35 to 41)    <= c_blank;
								 else 
									  slv_7seg_int(0 to 6)  <= c_E; 
									  slv_7seg_int(7 to 13)  <= c_r; 
									  slv_7seg_int(14 to 20)  <= c_r; 
									  slv_7seg_int(21 to 27)   <= c_O; 
									  slv_7seg_int(28 to 34)   <= c_r; 
									  slv_7seg_int(35 to 41)    <= c_blank;
								 end if;
								 
							when others => 
									case slv_whole_lotteryinput(0 to 3) is
										when "0000" => slv_7seg_int(0 to 6) <= c_0;
										when "0001" => slv_7seg_int(0 to 6) <= c_1;
										when "0010" => slv_7seg_int(0 to 6) <= c_2;
										when "0011" => slv_7seg_int(0 to 6) <= c_3;
										when "0100" => slv_7seg_int(0 to 6) <= c_4;
										when "0101" => slv_7seg_int(0 to 6) <= c_5;
										when "0110" => slv_7seg_int(0 to 6) <= c_6;
										when "0111" => slv_7seg_int(0 to 6) <= c_7;
										when "1000" => slv_7seg_int(0 to 6) <= c_8;
										when "1001" => slv_7seg_int(0 to 6) <= c_9;
										when others => slv_7seg_int(0 to 6) <= c_dash;
									end case;
									
									case slv_whole_lotteryinput(4 to 7) is
										when "0000" => slv_7seg_int(7 to 13) <= c_0;
										when "0001" => slv_7seg_int(7 to 13) <= c_1;
										when "0010" => slv_7seg_int(7 to 13) <= c_2;
										when "0011" => slv_7seg_int(7 to 13) <= c_3;
										when "0100" => slv_7seg_int(7 to 13) <= c_4;
										when "0101" => slv_7seg_int(7 to 13) <= c_5;
										when "0110" => slv_7seg_int(7 to 13) <= c_6;
										when "0111" => slv_7seg_int(7 to 13) <= c_7;
										when "1000" => slv_7seg_int(7 to 13) <= c_8;
										when "1001" => slv_7seg_int(7 to 13) <= c_9;
										when others => slv_7seg_int(7 to 13) <= c_dash;
									end case;
									
									case slv_whole_lotteryinput(8 to 11) is
										when "0000" => slv_7seg_int(14 to 20) <= c_0;
										when "0001" => slv_7seg_int(14 to 20) <= c_1;
										when "0010" => slv_7seg_int(14 to 20) <= c_2;
										when "0011" => slv_7seg_int(14 to 20) <= c_3;
										when "0100" => slv_7seg_int(14 to 20) <= c_4;
										when "0101" => slv_7seg_int(14 to 20) <= c_5;
										when "0110" => slv_7seg_int(14 to 20) <= c_6;
										when "0111" => slv_7seg_int(14 to 20) <= c_7;
										when "1000" => slv_7seg_int(14 to 20) <= c_8;
										when "1001" => slv_7seg_int(14 to 20) <= c_9;
										when others => slv_7seg_int(14 to 20) <= c_dash;
									end case;
									
									case slv_whole_lotteryinput(12 to 15) is
										when "0000" => slv_7seg_int(21 to 27) <= c_0;
										when "0001" => slv_7seg_int(21 to 27) <= c_1;
										when "0010" => slv_7seg_int(21 to 27) <= c_2;
										when "0011" => slv_7seg_int(21 to 27) <= c_3;
										when "0100" => slv_7seg_int(21 to 27) <= c_4;
										when "0101" => slv_7seg_int(21 to 27) <= c_5;
										when "0110" => slv_7seg_int(21 to 27) <= c_6;
										when "0111" => slv_7seg_int(21 to 27) <= c_7;
										when "1000" => slv_7seg_int(21 to 27) <= c_8;
										when "1001" => slv_7seg_int(21 to 27) <= c_9;
										when others => slv_7seg_int(21 to 27) <= c_dash;
									end case;
									
									case slv_whole_lotteryinput(16 to 19) is
										when "0000" => slv_7seg_int(28 to 34) <= c_0;
										when "0001" => slv_7seg_int(28 to 34) <= c_1;
										when "0010" => slv_7seg_int(28 to 34) <= c_2;
										when "0011" => slv_7seg_int(28 to 34) <= c_3;
										when "0100" => slv_7seg_int(28 to 34) <= c_4;
										when "0101" => slv_7seg_int(28 to 34) <= c_5;
										when "0110" => slv_7seg_int(28 to 34) <= c_6;
										when "0111" => slv_7seg_int(28 to 34) <= c_7;
										when "1000" => slv_7seg_int(28 to 34) <= c_8;
										when "1001" => slv_7seg_int(28 to 34) <= c_9;
										when others => slv_7seg_int(28 to 34) <= c_dash;
									end case;
									slv_7seg_int(35 to 41)  <= c_blank;
									  
							end case;
					

        else 
            slv_7seg_int(0 to 6)  <= c_E; 
            slv_7seg_int(7 to 13)  <= c_r; 
            slv_7seg_int(14 to 20)  <= c_r; 
            slv_7seg_int(21 to 27)   <= c_O; 
            slv_7seg_int(28 to 34)   <= c_r; 
            slv_7seg_int(35 to 41)    <= c_blank;
        end if;
        slv_7seg <= slv_7seg_int;
	end process p_message_display;

end architecture a_hex7seg;
