(Select ped.codusur,ped.numped,ped.codprod,ped.codcli,ped.qt,pro.qtunitcx,pro.embalagem
    from pcpedi ped, pcprodut pro
    where CODFORNEC = 1658
    and ped.CODPROD = pro.CODPROD
    and ped.posicao like 'F'
    --and ped.qt <> ped.qtseparada
    and DATA BETWEEN '30-JAN-2023' AND '30-abr-2023')
