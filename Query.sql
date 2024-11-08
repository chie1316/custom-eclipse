           DBMS_LOB.SUBSTR(
               XMLAGG(XMLELEMENT(E, NVL(RPLT.AGENT_PENDING_ENG_TXT, ' ') || '||')
               .EXTRACT('//text()') 
               ORDER BY RPLT.PENDING_CD, RPLT.AGENT_PENDING_ENG_TXT)
               .GETCLOBVAL(), 
               4000, 
               1
           ) AS AGENT_PENDING_ENG_TXT,

           DBMS_LOB.SUBSTR(
               XMLAGG(XMLELEMENT(E, NVL(TO_CHAR(RPLT.AGENT_PENDING_CHN_TXT), ' ') || '||')
               .EXTRACT('//text()') 
               ORDER BY RPLT.PENDING_CD, RPLT.AGENT_PENDING_CHN_TXT)
               .GETCLOBVAL(), 
               4000, 
               1
           ) AS AGENT_PENDING_CH_TXT,

           DBMS_LOB.SUBSTR(
               XMLAGG(XMLELEMENT(E, NVL(TO_CHAR(RPLT.PENDING_DETAIL), ' ') || '||')
               .EXTRACT('//text()') 
               ORDER BY RPLT.PENDING_CD, RPLT.AGENT_PENDING_ENG_TXT, RPLT.AGENT_PENDING_CHN_TXT)
               .GETCLOBVAL(), 
               4000, 
               1
           ) AS PENDING_DETAIL
