library ieee;
use ieee.std_logic_1164.all;

entity timer is
    port(clk: in std_logic;
         mode: in std_logic_vector(1 downto 0);
         clock_limiter: in std_logic_vector(7 downto 0);
         timer0: out std_logic);
end timer;

architecture de_tempo_ao_tempo of timer is
    component normal_mode is 
        port(clk: in std_logic;
            timer: out std_logic);
    end component;

    component fastPWM_mode is 
        port(clk: in std_logic;
            duty_cycle: in std_logic_vector(7 downto 0);
            timer: out std_logic);
    end component;

    component phasePWM_mode is 
        port(clk: in std_logic;
            duty_cycle: in std_logic_vector(7 downto 0);
            timer: out std_logic
            --; contador_out: out std_logic_vector(7 downto 0)
            );
    end component;

    component ctc_mode is 
        port(clk: in std_logic;
            top: in std_logic_vector(7 downto 0);
            timer: out std_logic
            --;con_out: out std_logic_vector(7 downto 0)
            --; clrO: out std_logic
            --;changeO: out std_logic
            );
    end component;

    component mux4x1 is
        port(in0, in1, in2, in3: in std_logic;
            s: in std_logic_vector(1 downto 0);
            out_mux: out std_logic);
    end component;

    signal t0, t1, t2, t3, timer_aux: std_logic;

begin

    NORMAL00: normal_mode port map(clk, t0); -- t0
    FASTPWM00: fastPWM_mode port map (clk, clock_limiter, t1); -- t1
    PHASEPWM00: phasePWM_mode port map (clk, clock_limiter, t2); -- t2
    CTC00: ctc_mode port map (clk, clock_limiter, t3); -- t3

    MUXOUT00: mux4x1 port map (t0, t1, t2, t3, mode, timer_aux);

    timer0 <= timer_aux;

end de_tempo_ao_tempo;