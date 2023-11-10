--------------------First Part-----------------------

SELECT PART_NO,
                BUY_QTY_DUE,
                CURRENCY_RATE,
                (FBUY_UNIT_PRICE * BUY_QTY_DUE) AS TOTAL_USD_VALUE,
                (BUY_UNIT_PRICE * BUY_QTY_DUE) AS TOTAL_LKR_VALUE,
                BUY_UNIT_PRICE AS GRN_PRICE --This asked to take as (BUY_UNIT_PRICE * BUY_QTY_DUE)/BUY_QTY_DUE as same as BUY_UNIT_PRICE
               
FROM PURCHASE_ORDER_LINE_PART
WHERE ORDER_NO = 'I2300156'

 
-------------------Second Part---------------------

select  x.XORDERNO AS ORDER_NO1,
		    x.XPARTNO AS PART_NO1,
            x.XCHARGETYPE AS YCHARGETYPE,
            x.XCHARGE_AMOUNT AS YCHARGEAMOUNT,
            x.XYTOTAL,
            x.XFBUY_UNIT_PRICE AS YXFBUY_UNIT_PRICE,
            x.XBUY_QTY_DUE AS YXBUY_QTY_DUE
            
        
from 	(select b.CHARGE_TYPE as XCHARGETYPE,
                        a.ORDERNO as XORDERNO,
                        a.PARTNO as XPARTNO,
                        a.YTOTAL as XYTOTAL,
                        b.CHARGE_AMOUNT as XCHARGE_AMOUNT,
                        a.FBUY_UNIT_PRICE as XFBUY_UNIT_PRICE,
                        a.BUY_QTY_DUE as XBUY_QTY_DUE
                from        (select f.fORDERNO as ORDERNO,
                                            p.PART_NO as PARTNO,
                                            f.TotalPrice as YTOTAL,
                                            p.FBUY_UNIT_PRICE as FBUY_UNIT_PRICE ,
                                            p.BUY_QTY_DUE as BUY_QTY_DUE
                                 from       (select ORDER_NO as fORDERNO,
                                                            sum(FBUY_UNIT_PRICE * BUY_QTY_DUE) as TotalPrice 
                                                 from IFSAPP.PURCHASE_ORDER_LINE_PART 
                                                 group by ORDER_NO ) f,
                                IFSAPP.PURCHASE_ORDER_LINE_PART p
                                 where f.fORDERNO=p.ORDER_NO ) a,
             IFSAPP.PURCHASE_ORDER_CHARGE b
             where a.ORDERNO=b.ORDER_NO 
            and  b.CONNECT_TO_LINE_NO is  null) x 
        -------------------------------------------------------------------------------------------------------------
        
select CODE_I,TEXT,AMOUNT,CODE_E,CODE_E_DESC from GEN_LED_VOUCHER_ROW_UNION_QRY
where CODE_I  ='I2300156' and ACCOUNT = '1351003' 

select count(CODE_I) from GEN_LED_VOUCHER_ROW_UNION_QRY 
where ACCOUNT = '1351003' 

SELECT 			p."ORDER_NO" as "ORDER_NO",
				p."PART_NO" as "PART_NO",
                 p."DESCRIPTION" as "PART_NAME",
                p.BUY_QTY_DUE,
                p.FBUY_UNIT_PRICE,
                p.BUY_UNIT_PRICE
          
FROM "IFSAPP"."PURCHASE_ORDER_LINE_PART" p
;









