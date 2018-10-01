library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity data_array1 is 

  port (
    clk: in std_logic;
    wren:in std_logic;
    wrdata:in std_logic_vector(31 downto 0);
    address: in std_logic_vector(5 downto 0);
    data:out std_logic_vector(31 downto 0)
  );

end data_array1;

architecture expresion of data_array1 is
  type dataarray is array (63 downto 0) of 
  std_logic_vector(31 downto 0);
signal da: dataarray;

  
  
  begin
    process (clk)
      begin
        
        if (wren='1') then
           da(conv_integer(address)) <= wrdata; 
           data <= da(conv_integer(address));
        else
           data <= da(conv_integer(address)); 
        end if;

    end process;
  end expresion;