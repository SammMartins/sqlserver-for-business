select cli.cliente, /*0*/ 
-------------------------------------------------------------------------------
/*1*/   (select
 sum(mov.qt * mov.punit)  --  <----- AQUI QUANTIDADE VZ O PRE�O 
        from pcmov mov
        join pcprodut B on mov.codprod = B.codprod
               where mov.codcli = cli.codcli
        and B.codfornec = 588
        and mov.dtmov between '01-jan-2023' and '18-jan-2023' --'{DATAINI}' AND '{DATAFIN}'
        and mov.codoper --not like 'ED' <---- AQUI 
 -- VC S� PRECISA  BUSCAR NA PCMOV NO CAMPO DE PRE�O � PUNIT QUE SIGNIFICA PRE�OUNIT�RIO AI SOMA COM A QUANTIDADE
        = 'ED'
        ) danone
-------------------------------------------------------------------------------

from Pcclient cli --, pcpedi ped

where cli.codcli in (1508,1507,8416,8976)--({CLIENTE)}


group by cli.cliente, cli.codcli

--select codoper from pcmov where dtmov between '01-jan-2023' and '18-jan-2023'
