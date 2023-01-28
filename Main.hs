import Control.Arrow

calculaQuadrado :: Int -> Int
calculaQuadrado x = x*x

somaTres :: Int -> Int
somaTres x = x + 3

calculaQuadradoDepoisSomaTres :: Int -> Int
calculaQuadradoDepoisSomaTres =  somaTres . calculaQuadrado

calculaQuadradoDepoisSomaTres' :: Int -> Int
calculaQuadradoDepoisSomaTres' x = (somaTres . calculaQuadrado) x

g :: Int -> Int
g x = x*x

f :: Int -> Int
f x = x + 3

fg :: Int -> Int 
fg x = (f . g) x

inverteSinal :: Int -> Int
inverteSinal x = (-1) * x

--quadradoDepoisInversaoDeSinal :: Int -> Int
--quadradoDepoisInversaoDeSinal = compose inverteSinal calculaQuadrado

quadradoDepoisInversaoDeSinal' :: Int -> Int
quadradoDepoisInversaoDeSinal' = inverteSinal . calculaQuadrado

dobraValor :: Int -> Int
dobraValor x = x*2

somaCinco :: Int -> Int
somaCinco x = x + 5

funcaoCompostaComLambda :: Int -> Int
funcaoCompostaComLambda = \x -> somaCinco (dobraValor x)

quadruplicaValor :: Int -> Int
quadruplicaValor x = x*4

dividePor2 :: Int -> Int
dividePor2 x = x `div` 2

somaDez :: Int -> Int
somaDez x = x + 10 

substraiUm :: Int -> Int
substraiUm x = x - 1

funcComposta:: Int -> Int 
funcComposta = \x -> substraiUm(somaDez(dividePor2(quadruplicaValor x)))

itemize :: [String] -> [String]
itemize listaStrings = map (\word-> "<li>" ++ word ++ "</li>") listaStrings

itemize' :: [String] -> [String]
itemize' listaStrings = map (\word-> "<li>" ++ word) listaStrings

main = do
  putStrLn "Hello"
  putStrLn "World"
