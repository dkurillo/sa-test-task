SELECT req."Registration_date",
 	sum(sub1."Sum")
FROM public."Request" req
LEFT JOIN (
  SELECT rc."RequestID", contr."Number", contr."Date", contr."Sum"
  FROM PUBLIC."Request_contract" rc
  LEFT JOIN PUBLIC."Contract" contr ON contr."ContractID" = rc."ContractID"
  WHERE rc."Is_active" = TRUE
) sub1 ON sub1."RequestID" = req."RequestID"
WHERE req."Registration_date" = CURRENT_DATE
GROUP BY req."Registration_date"
