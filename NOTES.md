Elixir:
1. iex (interactive elixir):
    * IEx.Helpers
    * iex > h()  - chama o modulo helper
    * iex > h(Enum) - chama o modulo helper pro Enum
    * iex > h(Enum.map) - chama o modulo helper pra função Enum.map()
    * iex > r() - recompila o modulo atual
    * iex > r(Example) - recompila o modulo Hello
    * iex > i() - imprime os detalhes sobre o termo dado
    * iex > i(“Hello”) - imprime os detalhes sobre a string “Hello”
    * 2x CTRL+C - quita do iex
    * CTRL C + Q + ENTER - quita do iex
    * CTRL + K - clear no console do iex

2. TUDO é uma expressão!
    * iex > IO.puts(“Hello”)
    
		Hello World
		:ok
		

 Principios LF:
 
	- Lazy Evaluation/Delayed Evaluation/Call-by-name: O programa só carrega/referencia a variável na memória quando a variável for utilizada.
	- “I know what to do. Wake me up when you really need it”;
	- Statements: Cada linha de código é um statement, ou seja, irá retornar algo;
	- Pattern Matching (Correspondência de padrões);
	- Paralelismo/Concorrência: dual core, quad core, octa core facilita a execução de processos paralelos sendo executados para a linguagem funcional, com o 	    auxilio da VM do Erlang (BEAM).
	- Erlang: linguagem criada para resolver problemas de telefonia, escalabilidade, e concorrencia. 
	- BEAM: Máquina virtual que o código Erlang/Elixir é compilado. Bogdan’s Erlang Abstract Machine / Bjorn’s Erlang Abstract Machine
	- Why Elixir: beneficios do Erlang, sintaxe amigável, paralelismo, concorrencia.


 Tipos básicos do Elixir:
 
	iex > 1      # integer
	iex > 1.0   # float 
	iex > 0x1F   # integer
	iex > true   # boolean
	iex > :atom.    # atom/symbol
	iex > “elixir”   # string
	iex > [1,2,3]   # lista
	iex > {1,2,3}   # tupla

	prefixos binário, hexa e octal:
		- 0b: binário
		- 0x: hexadecimal
		- 0o: octa
	
 Átomos:

	- Átomos são constantes no qual seu nome é seu próprio valor.
	- true e false são átomos.

 Strings:
  
	- No Elixir, são representadas em binários (sequência de bytes) E NÃO UM VETOR DE CARACTERES.
	- Representado por aspas duplas: “Elixir é legal”	
	- is_binary(“Murilo”) # true    
	- Representação binaria de uma string: “José” <> <<0>>

 Charlists:

	- Array de caracteres
	- Representado por aspas simples:  ‘Elixir é legal’ 
    
 Listas: 
 
	- Listas sao delimitadas por colchetes: [:yes, 23, “murilo”]
	- Listas no Elixir são LISTAS ENCADEADAS em sua essência.
	- Não existe posição da lista. Apenas referencia da memória através de hd() e tl()
	- Sao armazenadas em posições aleatórias da memória.
	iex > I [:yes, 23, “murilo”) # data type list
	- [:yes, 23, “murilo”] ++ [1,2,3] # [:yes, 23, “murilo”, 1, 2, 3]

 Tuplas:

	- Sao armazenadas de forma contígua (lado a lado) na memória.
	- Para acessar, usar funções como elem. 
	iex > tp = {123, 2.0, :murilo}
	iex > elem(tp, 1) # 2.0	

 Imutabilidade
 
	- Elixir trabalha com binding de variáveis (uma referencia que aponta pro valor)
		total = 358
		total = 938  # rebinding de valor da variável
	- Ser imutável nao quer dizer que o valor nunca mudará, mas ele está protegido de mudanças externas.
	- Simplificar o trabalho de paralelismo. 

 Funções Anônimas 
 
 	one_plus_one = fn -> 1 + 1 end
	one_plus_one.()

 Capture operator
 
	a_plus_b = fn a,b -> a + b end 
 	se torna com capture \/
	a_plus_b = &(&1 + &2)
	
	upcase = &String.upcase/1
	upcase.("hello world")
	
 Pipe operator
	 
	"Ola" 
	|> String.length() 
	|> IO.puts()
	3
	:ok
	
 First-Class Functions
 	
	Uma função deve ser como qualquer outro valor, como no Elixir que funções sao do tipo function.
	iex > abc = fn -> "Bauer" end
	iex > i(abc)
	Term
	  #Function<45.79398840/0 in :erl_eval.expr/5>
	Data type
	  Function
	...
	
	Exemplo:
	taxa_basica = fn(preco) -> 5 end
	taxa_promocional = fn(preco) -> preco * 0.12 end
	preco_total = fn(preco, funcao_taxa) -> preco + funcao_taxa.(preco) end
	
	iex > taxa_basica.(30239)
	5
	
	iex > taxa_promocional.(100)
	12.0
	
	iex > preco_total.(1000, taxa_basica)
	1005
	
	iex > preco_total.(1000,taxa_promocional)
	1120.0
	
	Funcao sendo chamada por parametro como qualquer outro valor.
	
 Higher-Order Function
 	
	High-order function é uma funcao que pode receber uma funcao como argumento ou retornar uma funcao.
	PS: Order functions é o contraste de high-order functions, pois nao podem receber funções como argumento.
	
	defmodule Salario do
		def calculo_do_bonus(porcentagem) do
			fn(salario) -> salario * porcentagem end     # retornando a funcao
		end
	end
	
	bonus_para_gerente = Salario.calculo_do_bonus(1.05)
	bonus_para_gerente.(1000)
	# => 1050
	
  First-Class Functions vs Higher-Order functions
  	
	Elixir trata as funcoes como first-class functions, ou seja, trata as funções como valores que você pode, inclusive, atribuir a uma variável.
	Higher-order functions são funções que trabalham com outras funções, podendo também retorná-las.
	
   Match operator
   
  	`=` não é um operador de atribuição no Elixir, como nas outras linguagens.
	O match operator (=) é um operador binário que necessita de dois elementos para serem avaliados (um de cada lado).
	
	left hand \/   \/ right hand
	          x  =  1
	
   Pattern Matching
   	
	{a, b, c} = {:murilo, 23, "1998"}
	iex(1) > a
	:murilo
	
	iex(1) > b
	23
	
	iex(2) > c 
	1998
	
	# No caso de erros/excecoes
	{d,e} = {"sumup", "SP", 2}
	** (Match error) no match of right hand side value: {"sumup", "SP", 2}
	
	iex(3) > [cabeca | cauda] = [1,2,3]
	[1,2,3]
	
	iex(4) > cabeca
	1
	
	iex(5) > cauda
	[2,3]

   Underscore _
   
   	{x,y} = {25,35}
	# Mas e se eu nao quiser utilizar o valor 25 e associar na memória para y? Preciso alocar e jogar memória "fora" para y?
	
	Solução: 
	{x, _} = {25,35}
	
	{x, _} = {25,1203}
	
	# x será 25.
	# y será 35, pois utilizou o underscore para ignorar o próximo valor (1203).
	
    
   Pin Operator
    
        iex(1) > x = 23
	23
	
	iex(2) > x = 101
	101

	Variável x começou apontando para 23 na memoria, mas logo apos foi feito o rebinding para 101. 
	O que fazer para evitar reassociacao/rebinding? 
	Resposta: PIN OPERATOR (ˆ)

	iex(3) > ˆx = 45
	** (MatchError) no match of right hand side value: 45

	Utilidade: Pin Operator + Pattern Matching

	{x,y} = {23, 90}

	iex(4) > x
	23

	iex(5) > y
	90

	{x,ˆy} = {12, 67}
	** (MatchError) no match of right hand side value: {12,67}

	
   String Matching
   
   	- Correspondencia de padrões com string.
	
	iex(1) > "Authentication: " <> credentials = "Authentication: Basic dXN01239Maldk0DkaMD" 
	"Authentication: Basic dXN01239Maldk0DkaMD"
	
	iex(2) > credentials
	"Basic dXN01239Maldk0DkaMD"
			
	iex(3) > "Content-Type: " <> content_type = "Content-Type text/html; charset=UTF-8"
	"Content-Type: text/html; charset=UTF-8"
	
	iex(4) > content_type
	"text/html; charset=UTF-8"
	
   Listas
 
	- Listas sao delimitadas por [].
	- Listas sao encadeadas, portanto nao possuem indexação.
	- É trabalhado com cabeça e cauda (hd/1, tl/1).
	
	iex(1) > minha_lista = ["murilo", "bauer", "cardoso"]
	iex(2) > hd(minha_lista)
	"murilo"
	
	iex(3) > tl(minha_lista)
	["bauer", "cardoso"]
  	
	
   Tuplas
	
	- Tuplas sao delimitadas por {}.
	- Tuplas sao indexáveis. (Posição 0,1,2,3....)
	- Pode-se acessar atraves de elem/2 e sua posição.
	
	iex(1) > minha_tupla = {2006,2010}
	iex(2) > elem(minha_tupla, 1)
	2010
	
   Keyword Lists
	 
	"A keyword list is a list of two-element tuples where the first element of each tuple is an atom."
		
	- Keyword Lists devem possuir átomos como chave
	- OBRIGATORIAMENTE a chave deve ser um átomo.
	- Nas keyword lists, a ordem das chaves importa.
	- Nas kwd lists, pode possuir chaves repetidas.
	
	iex(1) > [{:a, 22}, {:b, 77}] == [a: 22, b:77]
	true
	
	iex(2) > minha_keyword_list = [a: 10, b: 45]
	[a: 10, b: 45]
	
	iex(3) > minha_keyword_list[:a]
	10
	
	- Permite chaves repetidas (pois é uma lista), porém retornará apenas o primeiro key-value:
	x = [a: 22, b: 35, a: 99]
	iex(1) > x[:a]
	22
	
   Maps
	
	- Maps são delimitados por %{}
	- Maps são indexados.
	- Não são permitidas chaves repetidas.
	- A chave pode ser qualquer tipo de dado.
	
	m = %{:a => 1, 2 => :b}
	n = %{"z" => 5, 8 => true}
	
	iex(1) > m[2]
	:b
	
	iex(2) > n["z"]
	5
	
	- É possivel acessar as chaves do tipo átomo através da sintaxe do ponto. 
	iex(1) > x = %{ :a => "murilo", :b => "bauer"}
	x = %{ :a => "murilo", :b => "bauer"}
	
	iex(2) > x.a
	"murilo"
	
	iex(3) > x.b
	"bauer"
	
    
   Múltiplas Definições de Funções 
   
   	- Podem ser definidas funções com o mesmo nome no módulo.
	
	defmodule Greetings do
		def good_morning(), do: "Good Morning"		

		def good_morning(name), do: "Good Morning, #{name}"

		def good_evening(), do: "Good Evening"	

		def good_evening(name), do: "Good Evening, #{name}"
		
   Controlando fluxo com funções 
   
   	- Como controlar fluxos condicionais com funções? COM PATTERN MATCHING.
	- Exemplo do maior numero:
		
		defmodule Compara do
			def maior(n1,n2) do
				check(n1 >= n2, n1,n2)
			end
		
		defp check(true, n1, _) do: n1
		defp check(false, _, n2) do: n2
	
	iex(1) > Compara.maior(6,9)
	9
	
	iex(2) > Compara.maior(16,9)
	16
	
	
   Guard Clauses
   	
	- Utilizar guard clauses com when na assinatura da funcao.
	
	defmodule Sum do
		def to(1), do: 1
		def to(n) when n > 0 and is_integer(n), do: n + to (n-1)
	end
  
   Recursão 
  
  	- Uma função recursiva é aquela que chama a si própria.
	- Em programação funcional temos estados imutáveis, então é importante que seja feito recursão.
	- Identificar duas coisas antes de se fazer programas recursivos:
		1. Ponto de Parada (quando a recursão irá parar?)
		2. Regra Geral (resolução de subproblemas até ser resolvido o problema maior)
	
	defmodule Fatorial do
		def fat(0), do: 1
		def fat(n) when n > 0, do: n * fat(n-1)
	end
	

   Tail-Call Optimization
   	
	- Tail-Call optimization é qunado o compilador reduz as funções em memória sem alocar mais memória.
	- O negativo de usar essa técnica é a leitura do código, no qual fica mais complexo.
	- O positivo é que evita com que a memória "pendure" chamadas de funções para serem resolvidas, melhorando a performance.
	
	- Exemplo:
		defmodule TCFactorial do
			def of(n), do: factorial_of(n, 1)
			
			defp factorial_of(0, acc) do: acc
			defp factorial_of(n, acc) when n > 0, do: factorial_of(n-1, n * acc)
		end
