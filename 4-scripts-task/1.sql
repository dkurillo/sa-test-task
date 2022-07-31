SELECT req."Number",
 	req."Registration_date",
 	obj."Name" AS object_name,
 	cont."Name" AS customer_name,
 	st."Status_name" AS status,
 	sub1."Number",
 	sub1."Date",
 	sub2."implementers"
FROM public."Request" req
LEFT JOIN PUBLIC."Object" obj ON req."ObjectID" = obj."ObjectID"
LEFT JOIN PUBLIC."Contractor" cont ON cont."ContractorID" = req."ContractorID"
LEFT JOIN PUBLIC."Request_status" st ON st."Request_statusID" = req."Request_statusID"
LEFT JOIN (
  SELECT rc."RequestID", contr."Number", contr."Date"
  FROM PUBLIC."Request_contract" rc
  LEFT JOIN PUBLIC."Contract" contr ON contr."ContractID" = rc."ContractID"
  WHERE rc."Is_active" = TRUE
) sub1 ON sub1."RequestID" = req."RequestID"
LEFT JOIN (
  SELECT ri."RequestID", string_agg(contr."Name", ',') AS implementers
  FROM PUBLIC."request_implementer" ri
  LEFT JOIN PUBLIC."Contractor" contr ON contr."ContractorID" = ri."ContractorID"
  GROUP BY ri."RequestID"
) sub2 ON sub2."RequestID" = req."RequestID"