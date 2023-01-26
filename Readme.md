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

- Com o argumento x recebido _explicitamente_:
```
calculaQuadradoDepoisSomaTres :: Int -> Int
calculaQuadradoDepoisSomaTres x = (somaTres . calculaQuadrado) x
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
quadradoDepoisInversaoDeSinal :: Int -> Int
quadradoDepoisInversaoDeSinal = inverteSinal . calculaQuadrado
```
 #### **Exemplo 3) Utilizando a função ">>=" do Monad:**
 
# Provas de teoremas matemáticos com Haskell
Definições: 
-teorema matemático
-prova

Link para o projeto no Replit: 
