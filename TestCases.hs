-- Exercise 1
freeVariables (Lam 1(Lam 2 (App (Var 1) (App (Var 2) (Var 3))))) => [3]
freeVariables (App (Var 1) (Lam 1 (App (Var 2) (App (App (Lam 3 (App (Var 4) (Var 3))) (Var 2)) (Var 1))))) => [1,2,4,2]
freeVariables (Var 1) => 1
freeVariables (Lam 1 (App (Var 1) (Var 1))) => []
freeVariables (Lam 1 (Var 1)) = []
freeVariables (Lam 1 (App (Var 1) (Var 2))) = [2]

-- Exercise 2
rename (Lam 1 (App (Lam 1 (Var 1)) (Var 1))) 1 3 => Lam 3 (App (Lam 1 (Var 1)) (Var 3))
rename (Lam 1 (App (Lam 2 (App (Var 3) (Var 2))) (Var 2))) 2 5 => Lam 1 (App (Lam 5 (App (Var 3) (Var 5))) (Var 5))
rename (Lam 1 (Var 2)) 2 3 => Lam 1 (Var 3)
rename (App (Lam 2 (App (Var 3) (Var 5))) (Var 5))
rename (Lam 1 (Var 1)) 1 2 = (Lam 2 (Var 2))
rename (Lam 1 (Lam 1 (Var 1))) 1 2 = (Lam 2 (Lam 1 (Var 1)))



-- Exercise 3
alphaEquivalent (Var 1) (Var 2) = False
alphaEquivalent (App (Lam 2 (App (Var 3) (Var 5))) (Var 5)) (App (Lam 5 (App (Var 5) (Var 3))) (Var 5)) = False
alphaEquivalent (Lam 1 (Var 2)) (Lam 2 (Var 1)) = True
alphaEquivalent (Lam 2 (Var 2)) (Lam 2 (Var 2)) = True
alphaEquivalent (Lam 2 (Var 3)) (Lam 1(Var 3)) = True
alphaEquivalent  (Lam 2 (Var 2)) (Lam 1 (Var 1)) = True
alphaEquivalent  (App (Var 1) (Lam 1 (Var 2))) (App (Var 1) (Var 2)) = False
alphaEquivalent  (Lam 1 (Var 1)) (Lam 2 (Var 2)) = True


-- Exercise 4
hasRedex  (App (Var 1) (Lam 1 (Var 2))) = True
hasRedex (App (Var 1) (Var 2)) = False
hasRedex (App (Lam 1(Var 1)) (Var 2)) = True
hasRedex (App (App (App (Var 1) (Lam 1 (Var 2))) (Var 3)) (Var 4)) = True
hasRedex (Lam 1 (Var 2)) = False
hasRedex (App (Lam 1 (Var 1)) (Var 1)) = True
hasRedex (Lam 1 (App (Var 1) (Var 2))) = False

-- exercise 5
substitute (App (Var 1) (Lam 5 (Var 1))) 1 (App (Var 2) (Var 3)) = App (App (Var 2) (Var 3)) (App (Var 2) (Var 3))
substitute (Var 1) 1 (Var 2) = (Var 2)
substitute (Lam 1 (Var 1)) 1 (Var 2) = (Lam 1 (Var 1))
substitute (Lam 2 (Var 1)) 1 (Var 2) = (Lam 3 (Var 2))


-- Section 2 (Pretty print)
prettyPrint (Lam 1 (Lam 2 (App (Var 1) (Var 3)))) = "\\x1x2->x1x3"
prettyPrint (Lam 1 (Lam 2 (Lam 3 (App (Var 1) (App (Var 2) (Var 3)))))) = "\\x1x2x3->x1(x2x3)"


-- Section 4 (Translate)
translate (Lam 1 (Lam 2 (Var 1))) = AppCL (AppCL S (AppCL K K)) (AppCL (AppCL S K) K)
translate (App (Lam 1 (Var 1)) (Var 2)) = AppCL (AppCL (AppCL S K) K) (VarCL 2)



