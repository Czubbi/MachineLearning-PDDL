

(define (problem BW-rand-8)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 b8 )
(:init
(ontable b1)
(on b2 b7)
(on b3 b1)
(on b4 b6)
(on b5 b8)
(ontable b6)
(on b7 b5)
(ontable b8)
(clear b2)
(clear b3)
(clear b4)
)
(:goal
(and
(on b1 b4)
(on b2 b8)
(on b4 b7)
(on b5 b2)
(on b6 b5)
(on b8 b1))
)
)


