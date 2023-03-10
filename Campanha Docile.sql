Select rca.codsupervisor,rca.codusur || ' ' ||rca.nome RCA,
------------------------------------------------------------------------------------------------------------------
--Atingir meta Sell-out Mar./Abr. de R$ 190.000,00
(SELECT SUM(mov.QT*mov.PUNIT) faturamento 
    from pcmov mov
    JOIN PCPRODUT prod ON mov.CODPROD = prod.CODPROD
    WHERE mov.dtmov BETWEEN '01-mar-2023' and '30-abr-2023'
    and mov.codusur = rca.codusur
    --AND mov.codoper = 'S'
    and prod.codfornec = 1627) - (select nvl(sum(mov.qt * mov.punit),0)
                                        from pcmov mov
                                        join pcprodut B on mov.codprod = B.codprod
                                        where mov.codcli = rca.codusur
                                        and mov.dtmov between '01-mar-2023' and '30-abr-2023'
                                        and mov.codoper = 'ED') Faturamento,
------------------------------------------------------------------------------------------------------------------
--1.600 positivações somando os 2 meses
(select count(distinct b.codcli)
from pcmov b 
join pcprodut d on b.codprod = d.codprod
where b.codfornec = 1627
AND B.CODOPER = 'S'
and b.codusur = rca.codusur
and b.dtmov between '01-mar-2023' and '30-abr-2023') Positivado
------------------------------------------------------------------------------------------------------------------
from pcusuari rca
Where rca.DTULTVENDA > '01-mar-2023'
and rca.codsupervisor in (2,8,9) and rca.codusur not in (2,149,160,148,145,150,152,168,174)


order by rca
--Sell-inn de R$ 140.000,00 NO BIMESTRE


--select * from pcmov
