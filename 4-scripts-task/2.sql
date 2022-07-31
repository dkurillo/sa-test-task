SELECT COUNT(*)
FROM public."Request" req
JOIN (
  SELECT rc."RequestID", contr."Number", contr."Date"
  FROM PUBLIC."Request_contract" rc
  LEFT JOIN PUBLIC."Contract" contr ON contr."ContractID" = rc."ContractID"
  WHERE rc."Is_active" = TRUE
  AND contr."Due_to" <= CURRENT_DATE
) sub1 ON sub1."RequestID" = req."RequestID"