library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity fsmBehav is
    port (  TOG_EN      : in std_logic;
            CLK,CLR     : in std_logic;
            Z1          : out std_logic);
end fsmBehav;

architecture fsmBehav of fsmBehav is
    type state_type is (ST0, ST1, ST2, ST3, ST4);
    signal PS, NS : state_type;

begin
    sync_proc: process(CLK, NS, CLR)
    begin
        if CLR = '1' then
            PS <= ST0;
        elsif rising_edge(CLK) then
            PS <= NS;
        end if;
    end process sync_proc;
    
    comb_proc: process(PS, TOG_EN)
    begin
        case PS is
            when ST0 =>
                Z1 <= '0';
                if TOG_EN = '1' then
                    NS <= ST1;
                else
                    NS <= ST0;
                end if;
            when ST1 =>
                Z1 <= '1';
                if TOG_EN = '1' then
                    NS <= ST2;
                else
                    NS <= ST1;
                end if;
            when ST2 =>
                Z1 <= '0';
                if TOG_EN = '1' then
                    NS <= ST3;
                else
                    NS <= ST2;
                end if;
            when ST3 =>
                Z1 <= '1';
                if TOG_EN = '1' then
                    NS <= ST4;
                else
                    NS <= ST3;
                end if;
            when ST4 =>
                Z1 <= '0';
                if TOG_EN = '1' then
                    NS <= ST0;
                else
                    NS <= ST4;
                end if;
            when others =>
                Z1 <= '0';
                NS <= ST0;
        end case;
    end process comb_proc;
    
end fsmBehav;
 
