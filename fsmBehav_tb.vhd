LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY fsmBehav_tb IS
END fsmBehav_tb;
 
ARCHITECTURE behavior OF fsmBehav_tb IS 
 
    -- Component Declaration for the Moore FSM Sequence Detector in VHDL
 
    COMPONENT fsmBehav
	port (  TOG_EN 		: in std_logic;
			CLK,CLR 	: in std_logic;
			Z1 			: out std_logic);
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal CLR : std_logic := '0';
   signal TOG_EN : std_logic := '0';

  --Outputs
   signal Z1 : std_logic;

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
 -- Instantiate the Moore FSM Sequence Detector in VHDL
   uut: fsmBehav PORT MAP (
          CLK => CLK,
          CLR => CLR,
          TOG_EN => TOG_EN,
          Z1 => Z1
        );

   -- Clock process definitions
   clock_process :process
   begin
  CLK <= '0';
  wait for clock_period/2;
  CLK <= '1';
  wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin  

--    CLR <= 	'1', '1' after 50 ps, '0' after 100 ps, '1' after 150 ps, '0' after 200 ps;
--    TOG_EN <= 	'0', '0' after 50 ps, '1' after 100 ps, '1' after 150 ps, '0' after 200 ps;
  	CLR	<= '1';
  	TOG_EN	<= '1';  
  	wait for 50 ns;
  	CLR	<= '0';
  	TOG_EN	<= '1';  
  	wait for 50 ns;  
  	CLR	<= '0';
  	TOG_EN	<= '0';  
  	wait for 50 ns;  

      -- insert stimulus here 
   --   wait;
   end process;

END;
