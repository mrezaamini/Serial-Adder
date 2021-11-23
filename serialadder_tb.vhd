library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb is 
end entity tb;

architecture behave of tb is 
component  serialAdder is generic (n : INTEGER := 8);
port(a,b : in std_logic_vector(n-1 downto 0);
    clk,start,nrst : in std_logic;
    cout,done : out std_logic;
    sum :  out std_logic_vector(n-1 downto 0)
    );
end component serialAdder;
signal a,b,sum : std_logic_vector(7 downto 0);
signal clk,start,nrst,cout,done : std_logic; 
begin
    dut: serialadder port map(a,b,clk,start,nrst,cout,done,sum);
process begin
    clk <= '1'; wait for 5 ns;
    clk <= '0'; wait for 5 ns;
end process;
process begin
    nrst<='0'; 
    a<="10101100";
    b<="00101101";
    start<='1';
    wait for 20 ns; 
    nrst<='1';
    wait for 100 ns;
    nrst<='0'; 
    a<="01100110";
    b<="00110011";
    start<='1';
    wait for 20 ns; 
    nrst<='1';
    wait;
    

end process;

end architecture behave;