select SNO from SPJ where JNO='J1'
select SNO from SPJ where JNO='J1' and PNO='P1'
select SNO from SPJ where JNO='J1' and
                    PNO in (select PNO from P where COLOR='��')
select JNO from J where not exists(select * from SPJ,S,P 
                      where SPJ.JNO=J.JNO 
                      and SPJ.SNO=S.SNO 
					  and SPJ.PNO=P.PNO 
					  and S.CITY='���' 
					  and P.COLOR='��')

select JNO from J where not exists
(select * from SPJ where SPJ.JNO=J.JNO and SNO in 
                (select SNO from S where S.CITY='���')
				and PNO in (select PNO from P where COLOR='��')


select distinct JNO from SPJ SPJZ where not exists
               (select * from SPJ SPJX where SNO='S1'
			    and not exists (select * from SPJ SPJY where 
				SPJY.PNO=SPJX.PNO and SPJY.JNO=SPYZ.JNO))