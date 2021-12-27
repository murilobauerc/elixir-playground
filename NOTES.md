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
	
	
	
