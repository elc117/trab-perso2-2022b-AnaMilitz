# Composição de funções em Haskell
### Definições:
> ***Compor funções*** é uma maneira comum e útil de criar novas funções em Haskell. A composição de Haskell é baseada na ideia de composição de função em matemática. Em matemática, se você tem duas funções f(x) e g(x), você calcula sua composição como f(g(x)). A expressão f(g(x)) primeiro chama g e depois chama f. - [CMPT 383](http://www.sfu.ca/~tjd/383summer2019/haskell_comp_and_app_lhs.html#:~:text=Composing%20functions%20is%20a%20common,g%20and%20then%20calls%20f).

>***Compor funções*** significa aplicar uma função a um argumento e, depois, aplicar outra função ao resultado da primeira função. - [Wikibooks](https://pt.wikibooks.org/wiki/Haskell/Composi%C3%A7%C3%A3o_de_fun%C3%A7%C3%B5es)

### Exemplos:
 #### **Exemplo 1) Utilizando o símbolo de composição:**
 Criamos duas funções simples que serão utilizadas para criar uma composta mais tarde:
```
calculaQuadrado :: Int -> Int
calculaQuadrado x = x*x

somaTres :: Int -> Int
somaTres x = x + 3
```
**Funções compostas equivalentes:** 

- Com o argumento x recebido _implicitamente_:
```
calculaQuadradoDepoisSomaTres :: Int -> Int
calculaQuadradoDepoisSomaTres =  somaTres . calculaQuadrado
```
Ex: calculaQuadradoDepoisSomaTres 5 
    R:28

- Com o argumento x recebido _explicitamente_:
```
calculaQuadradoDepoisSomaTres' :: Int -> Int
calculaQuadradoDepoisSomaTres' x = (somaTres . calculaQuadrado) x
```
Ex:
```
calculaQuadradoDepoisSomaTres 5   
R:28

ou 

calculaQuadradoDepoisSomaTres' 5   
R:28
```
    
**Equivalência matemática:**

Renomeando as funções acima...
- Em Haskell:
```
g :: Int -> Int
g x = x*x

f :: Int -> Int
f x = x + 3

fg :: Int -> Int 
fg x = (f . g) x
```

- Em funções matemáticas:
```
g(x) = x^2

f(x) = x + 3

fg(x) = f ∘ g (x) = f(g(x)) = (x^2) + 3
```

 #### **Exemplo 2) Utilizando a função compose:**

```
import Control.Arrow

calculaQuadrado :: Int -> Int
calculaQuadrado x = x*x

inverteSinal :: Int -> Int
inverteSinal x = (-1) * x

quadradoDepoisInversaoDeSinal :: Int -> Int
quadradoDepoisInversaoDeSinal = compose inverteSinal calculaQuadrado
```

Comparando com a utilização do símbolo de composição:
```
quadradoDepoisInversaoDeSinal' :: Int -> Int
quadradoDepoisInversaoDeSinal' = inverteSinal . calculaQuadrado
```
Ex:
```
quadradoDepoisInversaoDeSinal 5   
R:-25

ou 

quadradoDepoisInversaoDeSinal' 5   
R:-25
```

 #### **Exemplo 3) Utilizando uma função anônima (lambda):**
 Utilizando funções criadas do 0: 
 
 a) Utilizando 2 funções para criar uma composta:
 ```
dobraValor :: Int -> Int
dobraValor x = x*2

somaCinco :: Int -> Int
somaCinco x = x + 5

funcaoCompostaComLambda :: Int -> Int
funcaoCompostaComLambda = \x -> somaCinco (dobraValor x)
``` 
Ex: 
``` 
funcaoCompostaComLambda 2 
R: 9
``` 

b) Utilizando 4 funções para criar uma composta:
``` 
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
``` 

Ex: 
``` 
funcComposta 25
R: 59
```

c) Utilizando um exemplo em aula:

``` 
itemize :: [String] -> [String]
itemize listaStrings = map (\word-> "<li>" ++ word ++ "</li>") listaStrings
``` 
Ex: 
``` 
itemize ["ola"]
R: ["<li>ola</li>"]

itemize ["hello","world","bye"]
R: ["<li>hello</li>","<li>world</li>","<li>bye</li>"]
```

# Provas de teoremas matemáticos com Haskell
### Definições:
> Na matemática, um teorema é uma afirmação que pode ser provada como verdadeira, por meio de outras afirmações já demonstradas, como outros teoremas, juntamente com afirmações anteriormente aceitas, como axiomas.
> 
> Prova é o processo de mostrar que um teorema está correto. - [Wikipedia]([http://www.sfu.ca/~tjd/383summer2019/haskell_comp_and_app_lhs.html#:~:text=Composing%20functions%20is%20a%20common,g%20and%20then%20calls%20f](https://pt.wikipedia.org/wiki/Teorema#:~:text=Na%20matemática%2C%20um%20teorema%20é,que%20um%20teorema%20está%20correto.)).

### **Principais ferramentas para provar teoremas em Haskell:**
Coq, Agda, Isabelle/HOL, Lean, PVS, Mizar, HOL Light, Metamath, ACL2 e NuPRL.

### **Exemplo de prova de teorema em Haskell:**
Prova da proposição de Peano, utilizando a biblioteca Coq:
>"Todo número natural é o sucessor de outro número natural ou é o número zero".

```
Inductive numeroNatural : Conjunto :=
  | zero : numeroNatural
  | sucessor : numeroNatural -> numeroNatural.

Teorema Peano : para todo n : numeroNatural, n = zero ou (existe m : numeroNatural, n = sucessor m).
Prova.
intros.
inducao n.
- esquerda. reflexividade.
- direita. existe n. reflexividade.
Qed.
```

[Link para o projeto no Replit](https://replit.com/@Ana-Paula-Milit/projeto-composicao-de-funcoes#Main.hs)
