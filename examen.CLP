(deffacts hechos
	(robot platos 0 situacion 0)
	(mesas 0 0 0 0)
	(entrega 3 3 y 2 2)
	(recoger 4 3 y 2 1)
)

(defrule llevarPlatosACocina
	?f <- (robot platos ?x situacion ?y)
	(recoger $? ?a ?b $?)
	(test (= ?y
	=>
	(robot platos 0 situacion 0)
)
