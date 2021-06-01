library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
entity alu is
    Port ( a : in  STD_LOGIC_VECTOR (7 downto 0);
           b : in  STD_LOGIC_VECTOR (7 downto 0);
           alu_sel : in  STD_LOGIC_VECTOR (2 downto 0);
           alu_out : out  STD_LOGIC_VECTOR (7 downto 0);
           carry_out : out  STD_LOGIC;
           zero_out: out  STD_LOGIC);
			   
end alu;

architecture Behavioral of alu is

signal alu_result: std_logic_vector (7 downto 0);
signal tmp: std_logic_vector (8 downto 0);

begin
  process(a,b,alu_sel)
 begin
case(alu_sel) is
when "000"=> --addition
alu_result<= std_logic_vector(to_unsigned((to_integer(unsigned(a))+ to_integer(unsigned(b))),8));
when "001"=> --subtraction
alu_result <= std_logic_vector(to_unsigned((to_integer(unsigned(a))- to_integer(unsigned(b))),8));
when "010"=> --logical and
alu_result <= a and b;
when "011"=> --logical or
alu_result <= a or b;
when "100"=> --logical not
alu_result <= not a;
when "101"=> --logical nand
alu_result <= a nand b;
when "110"=> --logical nor
alu_result <= a nor b;
when others => alu_result <= a+b;
end case;
end process;

carry_out<= tmp(8);-- carry flag
zero_out <= '1' when tmp(7 downto 0) = "00000000" else '0';--zero flag
alu_out<= alu_result ;--outout
tmp <= ('0'&a) + ('0' &b);
end Behavioral;


