(deffacts hechos
	(robot platos 0)
	(mesas 0 0 0 0)
	(entrega 3 3 y 2 2)
	(recoger 4 3 y 2 1)
)

(defrule cargarPlatos
	?f <- (robot platos ?x)
	(entrega $? ?platos ?mesa $?)
	(test (<= (+ ?x ?platos) 4)
	=>
	(retract ?f)
	(assert (robot platos (+ ?x ?platos))
)

(defrule recogerPlatos
	?f <- (robot platos ?x)
	(recoger $? ?platos ?mesa $?)
	(test (<= (+ ?x ?platos) 4)
	=>
	(retract ?f)
	(assert (robot platos (+ ?x ?platos))
)

(defrule llevarPlatosACocina
	?f <- (robot platos ?x)
	(test (or () ()))
	=>
	(robot platos ?a)
)

