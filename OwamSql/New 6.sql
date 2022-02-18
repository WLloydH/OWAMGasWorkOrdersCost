SELECT ASSET_ID, 
    WORK_ORDER_NO, 
    COST_ACTUAL, 
    COST_CATEGORY, 
    STOCK_CODE,
    TRANSACTION_QUANTITY, 
    TRANSACTION_AMOUNT, 
    EMPLOYEE_NO, 
    TRANSACTION_TYPE, 
    TRANSACTION_HOURS, 
    COMMITTED_AMOUNT,
    (EMPLOYEE_COUNT1 + EMPLOYEE_COUNT2) as "EMPLOYEE_COUNT",
     Max(ADDRESS) as  "ADDRESS"   
  FROM (SELECT WO.ASSET_ID,
               WOC.WORK_ORDER_NO,
               WOC.ACTUAL_AMOUNT        AS "COST_ACTUAL",
               WOC.EXPENSE_CATEGORY     AS "COST_CATEGORY",
               NULL                     AS "STOCK_CODE",
               NULL                     AS "TRANSACTION_QUANTITY",
               NULL                     AS "TRANSACTION_AMOUNT",
               NULL                     AS "EMPLOYEE_NO",
               NULL                     AS "TRANSACTION_TYPE",
               NULL                     AS "TRANSACTION_HOURS",
               NULL                     AS "COMMITTED_AMOUNT",
               (SELECT Count(DISTINCT AL.EMPLOYEE_NO) FROM SA_ACCOUNT_LOG  AL WHERE WOC.WORK_ORDER_NO =  AL.WORK_ORDER_NO  AND AL.PLANT = '04' GROUP BY  AL.WORK_ORDER_NO, AL.PLANT ) AS EMPLOYEE_COUNT1,
                0 AS EMPLOYEE_COUNT2,                                             
               WO.ASSET_DESC            AS "ADDRESS"               
          FROM SV_WORK_ORDER_COST  WOC
               JOIN SA_WORK_ORDER WO ON WOC.WORK_ORDER_NO = WO.WORK_ORDER_NO
         WHERE     WOC.PLANT = '04'
               AND WOC.EXPENSE_CATEGORY IS NOT NULL
               AND WOC.WORK_ORDER_NO IS NOT NULL
               AND WO.PLANT = '04'
               AND WO.WORK_CATEGORY = 'MTSET'
        UNION 
        SELECT AL.ASSET_ID,
               AL.WORK_ORDER_NO,
               NULL     AS "COST_ACTUAL",
               NULL     AS "COST_CATEGORY",
               AL.STOCK_CODE,
               AL.TRANSACTION_QUANTITY,
               AL.TRANSACTION_AMOUNT,
               AL.EMPLOYEE_NO,
               AL.TRANSACTION_TYPE,
               AL.TRANSACTION_HOURS,
               AL.COMMITTED_AMOUNT,
               0 AS EMPLOYEE_COUNT1,                 
               (CASE EMPLOYEE_NO WHEN  NULL THEN 0 ELSE 1 END) AS "EMPLOYEE_COUNT2",     
              'x'  AS "ADDRESS"       
          FROM SA_ACCOUNT_LOG  AL
               JOIN SA_WORK_ORDER WO ON AL.WORK_ORDER_NO = WO.WORK_ORDER_NO
         WHERE     AL.PLANT = '04'
               AND (   AL.TRANSACTION_TYPE IN ('LR', 'LP')
                    OR AL.STOCK_CODE IN
                           ('PE1PIPE', 'PE2PIPE', 'PE3PIPE','PE4PIPE', 'PE5PIPE', 'PE6PIPE', 'PE7PIPE', 'TRACERWIRE', 'CSTRACERWIRE'))
               AND AL.WORK_ORDER_NO IS NOT NULL
               AND WO.PLANT = '04'
               AND WO.WORK_CATEGORY = 'MTSET') A                
               
GROUP BY ASSET_ID,WORK_ORDER_NO, EMPLOYEE_COUNT1 + EMPLOYEE_COUNT2, COST_ACTUAL, COST_CATEGORY, STOCK_CODE, TRANSACTION_QUANTITY, TRANSACTION_AMOUNT, EMPLOYEE_NO, TRANSACTION_TYPE, TRANSACTION_HOURS, COMMITTED_AMOUNT
 
 ORDER BY 1, 2