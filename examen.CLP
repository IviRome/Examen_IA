(deffacts hechos
	(robot platos 0 llevandoACocina 0)
	(mesas 0 0 0 0)
	(entrega 3 3 0 0 2 2)
	(recoger 4 3 0 0 2 1)
)

(defrule cargarPlatos
	(declare (salience 90))
	?f <- (robot platos ?x $?restoR)
	?f1 <- (entrega $?r1 ?platos ?mesa $?r2)
	(test (<= (+ ?x ?platos) 4))
	(test (<> ?platos 0))
	=>
	(retract ?f)
	(retract ?f1)
	(assert (robot platos (+ ?x ?platos) 0))
	(assert (entrega $?r1 0 ?mesa $?r2))
)

(defrule recogerPlatos
	(declare (salience 90))
	?f <- (robot platos ?x $?restoR)
	?f1 <- (recoger $?r1 ?platos ?mesa $?r2)
	?f2 <- (mesa $?resto1 ?m $?resto2)
	(test (<= (+ ?x ?platos) 4))
	(test (= (length $?resto1) (- ?mesa 1)))
	=>
	(retract ?f)
	(retract ?f1)
	(retract ?f2)
	(assert (robot platos (+ ?x ?platos) 1))
	(assert (recoger $?r1 $?r2))
	(assert (mesa $?resto1 (- ?m ?platos) $?resto2))
)

(defrule llevarPlatosACocina
	(declare (salience 100))
	?f <- (robot platos ?x llevandoACocina 1)
	(recoger $?r1 ?p ?m $?r1)
	(test (or (= ?x 4) (= ?p 0)))
	=>
	(retract ?f)
	(assert (robot platos 0 llevandoACocina 0))
)

(defrule llevarPlatosAMesa
	(declare (salience 100))
	?f <- (robot platos ?x llevandoACocina 0)
	?f1 <- (entrega $?r1 ?p ?mesa $?r2)
	?f2 <- (mesa $?resto1 ?m $?resto2)
	(test (= (length $?resto1) (- ?mesa 1)))
	(test (or (= ?x 4) (= $?p 0)))
	=>
	(retract ?f)
	(retract ?f1)
	(retract ?f2)
	(assert	(robot platos (- ?x ?p) llevandoACocina 0))
	(assert (entrega $?r1 $?r2))
	(assert (mesa $?resto1 ?p $?resto2))
)

(defrule finalizar
	(declare (salience 500))
	(entrega ?p1 ?m1)
	(recoger ?p2 ?m2)
	=>
	(halt)
)

