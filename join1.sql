-- 프로그래머스_상품을 구매한 회원 비율 구하기
 
 /* 처음 답
 select 
 date_format(pa.sales_date , '%Y') AS YEAR,
 date_format(pa.sales_date , '%m') AS MONTH,
 count(DISTINCT pa.user_id) as PURCHASED_USERS,
 ROUND(count(pa.user_id) / 
       (select count(user_id) from USER_INFO where date_format(joined , '%Y') = '2021'),1) as PURCHASED_RATIO
 from ONLINE_SALE AS PA 
 join ( 
 SELECT user_id,
     date_format(joined , '%Y') as year ,
     date_format(joined , '%m') as month
 from USER_INFO
 where date_format(joined , '%Y') = '2021'
) AS PB ON PA.user_id = PB.user_id
 group by date_format(pa.sales_date , '%Y') , date_format(pa.sales_date , '%m') 
 ORDER BY date_format(pa.sales_date , '%Y') , date_format(pa.sales_date , '%m') 
 */
 
 SELECT 
 A.YEAR AS YEAR,
 A.MONTH AS MONTH,
 COUNT(A.USER_ID) AS PUCHASED_USERS,
 ROUND(COUNT(A.USER_ID) / (SELECT COUNT(*) FROM USER_INFO WHERE date_format(joined , '%Y') = '2021'),1) AS PUCHASED_RATIO
 FROM 
 (SELECT DISTINCT 
         YEAR(PA.Sales_date) AS YEAR,
         MONTH(PA.Sales_date) AS MONTH,
         PA.USER_ID AS USER_ID         
  FROM ONLINE_SALE AS PA
  JOIN USER_INFO AS PB ON PA.USER_ID = PB.USER_ID
  WHERE date_format(PB.joined , '%Y') = '2021'
 )  A
 GROUP BY  A.YEAR , A.MONTH 
 ORDER BY  A.YEAR , A.MONTH 
 
 
 


