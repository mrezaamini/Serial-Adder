# GENERIC SERIAL ADDER
Sequential serial adders are economically efficient and simple to build. In serial adders, pairs of bits are added simultaneously during each clock cycle. This is a simple VHDL implementation of serial adder tested with serialAdder_tb as testbench.
## IMPLEMENTATION
Main entity of the serial adder consist of Start (for initializing the adder),Done(telling us that the adding process is complete), a and b(our input numbers), cout(final carry out), clk(main clock) and nrst(stands for not reset).
```vhd
entity serialAdder is generic (n : INTEGER := 8);
    port(a,b : in std_logic_vector(n-1 downto 0);
        clk,start,nrst : in std_logic;
        cout,done : out std_logic;
        sum :  out std_logic_vector(n-1 downto 0)
        );
end entity serialAdder;
```
Main process will always evaluate signals and the by each clock tick it will add count'th bit of a with count'th of b and put the result in count'th bit of sumSig then put the carry of this add into variable carry to save it for the next clock tick.

```vhd
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
```

## TEST:
for testing set a and b as input numbers in testbench and simulate it with softwares like modelsim. 
Test Example:
![modelsim test example](/test.png)
