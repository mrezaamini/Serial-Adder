library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity serialAdder is generic (n : INTEGER := 8);
    port(a,b : in std_logic_vector(n-1 downto 0);
        clk,start,nrst : in std_logic;
        cout,done : out std_logic;
        sum :  out std_logic_vector(n-1 downto 0)
        );
end entity serialAdder;

architecture behavioral of serialAdder is
    signal carry : std_logic := '0';
    signal sumSig : std_logic_vector (n-1 downto 0);
    begin 
    process(clk,nrst,start)
        variable count : INTEGER := 0;
    begin
        if nrst='0' then
            count := 0;
            carry<='0';
            done<='0';
	    cout<='0';
            sumSig<= (others => '0');
	    sum<= (others => '0');
        elsif rising_edge(clk) then
	    if  count=n  then
                    done<='1';
                    sum <= sumSig;
		    cout<=carry;
            end if;
            if (start='1') and (count<n)  then
                sumSig(count)<=a(count) xor b(count) xor carry;
                carry<=(a(count) and b(count)) or (a(count) and carry) or (carry and b(count));
                count:=count+1;
       
            end if;
 	    
        end if;
       
    end process;

end architecture behavioral;