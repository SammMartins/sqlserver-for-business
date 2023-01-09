SELECT
   PCUSUARI.codusur || ' - ' || PCUSUARI.nome /*concatena��o de duas colunas*/ vendedor, /*renomeando a coluna*/
   pcsuperv.codsupervisor || ' - ' || pcsuperv.nome as supervisor
FROM PCUSUARI

INNER JOIN pcsuperv /*tabela para jun��o*/
ON PCUSUARI.codsupervisor = pcsuperv.codsupervisor /*colunas equivalentes em ambas tabelas*/

WHERE PCUSUARI.bloqueio like 'N'
and PCUSUARI.nome like '%DANONE%'
and PCUSUARI.codsupervisor in  (4,8,9)--({SUPERVISOR})

order by codusur
