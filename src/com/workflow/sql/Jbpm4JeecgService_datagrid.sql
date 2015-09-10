SELECT P1.PDID, P1.PNAME, P1.PID, P1.PKEY, P1.PVERSION, P2.INSNUM
  FROM (SELECT DM.DBID_ PDID,
               DP.OBJNAME_ PNAME,
               MAX(IF(DP.KEY_='pdid', DP.STRINGVAL_, NULL)) PID,
               MAX(IF(DP.KEY_='pdkey', DP.STRINGVAL_, NULL)) PKEY,
               MAX(IF(DP.KEY_='pdversion', DP.LONGVAL_, NULL)) PVERSION
          FROM JBPM4_DEPLOYMENT DM, JBPM4_DEPLOYPROP DP
         WHERE DM.DBID_ = DP.DEPLOYMENT_
         GROUP BY DM.DBID_, DP.OBJNAME_) P1,
       (SELECT T.PKEY, MAX(T.PVERSION) PVERSION, SUM(T.NUM) INSNUM
          FROM (SELECT PD.PDID,
                       PD.PNAME,
                       PD.PID,
                       PD.PKEY,
                       PD.PVERSION,
                       PD.PLANGID,
                       INUM.NUM
                  FROM (SELECT DM.DBID_ PDID,
                               DP.OBJNAME_ PNAME,
                               MAX(IF(DP.KEY_='pdid', DP.STRINGVAL_, NULL)) PID,
                               MAX(IF(DP.KEY_='pdkey', DP.STRINGVAL_,NULL)) PKEY,
                               MAX(IF(DP.KEY_='pdversion',DP.LONGVAL_,NULL)) PVERSION,
                               MAX(IF(DP.KEY_='langid',DP.STRINGVAL_,NULL)) PLANGID
                          FROM JBPM4_DEPLOYMENT DM, JBPM4_DEPLOYPROP DP
                         WHERE DM.DBID_ = DP.DEPLOYMENT_
                         GROUP BY DM.DBID_, DP.OBJNAME_) PD
                  LEFT JOIN (SELECT T.PROCDEFID_ PID, COUNT(1) NUM
                              FROM JBPM4_HIST_PROCINST T
                             GROUP BY T.PROCDEFID_) INUM ON PD.PID = INUM.PID) T
         GROUP BY T.PKEY) P2
 WHERE P1.PKEY = P2.PKEY
   AND P1.PVERSION = P2.PVERSION