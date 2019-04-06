// programa feito para a aula de lógica em programação escola Olimpio
// autores Marcelo Josué Telles e Marcos Phoren
// este programa cria procedimentos que são utilizados para manipular um arquivo texto
// é exibido um menu onde o usuário pode escolher qual operação deseja realizar no arquivo texto
// é possível inserir, consultar, listar alterar e excluir informações do arquivo texto
// 29 de julho de 2009, versão 0.1
Program cadastro;
var
nome,n,nomeAlterado:string;  				    //a variável 'nome' será usada para gravar no arquivo, a variavel nomeAlterado sera usada para gravar no arquivo quando alguma alteração for feita na informação 'nome'
nomes:array[1..99]of string;                     //este array é usado para permitir as alterações, pois uma alterção é feita gravando todos os 'nomes' do arquivo no vetor inclusive o 'nome' alterado, permitindo que o seja reescrito o arquivo sem repetir nem perder 'nomes'. note que estamos limitando nossa quantidade de registros no arquivo em 99
medias:array[1..99]of real;                      //este array é usado para permitir as alterações, pois uma alteração é feita gravando todos os 'notas' do arquivo no vetor inclusive a 'nota' alterada, permitindo que o seja reescrito o arquivo sem repetir nem perder 'notas'. note que estamos limitando nossa quantidade de registros no arquivo em 99
media,mediaAlterada:real; 				    //a variável 'media' será usada para gravar no arquivo, a variavel mediaAlterada sera usada para gravar no arquivo quando alguma alteração for feita na informação 'media'
cont,quemAlterar,i,j,l,c:integer; 			    //a variável 'cont' será usada para contar quantos registros temos no arquivo (linha 144) para depois controlar o for (linha 31) que ira reescrever o arquivo durante as alterações. a variável 'quemAlterar' é bem autoexplicativa e sera alimentada durante o if linha 149 (que identifica o nome do cadastro a ser alterado)  que esta dentro do while linha 142 que por sua vez esta percorrendo o arquivo.
arquivo:text;							    //variável do tipo texto, será usada para armazenar o conteúdo do arquivo
op:char;                                         //variável usada para armazenar o que o usuário escolher no menu.
Procedure janela;
BEGIN
 textbackground ( black );
 textcolor (black);
 for j:=1 to 80 do
 begin
  for i:=1 to 25 do
  begin
   gotoxy(j,i);
   textcolor (black);
   write(chr(219));
  end;
 end;


for j:=3 to 75 do
 begin
  for i:=3 to 20 do
  begin
   gotoxy(j,i);
   textcolor (green);
   write(chr(219));
  end;
 end;
 for i:=4 to 21 do
 begin
  gotoxy(76,i);
  writeln(chr(176));
 end;

 for i:=4 to 76 do
 begin
  gotoxy(i,21);
  writeln(chr(176));
 end;
 textbackground ( green );
 textcolor (black);
 gotoxy(35,4);

END;

Procedure inicializa;                            //procedimento para inicialização do arquivo ou seja cria um arquivo novo, apaga um existe, se existir, cuidado!
BEGIN                                            //inicio da procedure inicializa
 assign(arquivo,'c:\notas1.dat');                //coloco na variável 'arquivo' o texto que esta dentro do arquivo notas1.dat
 rewrite(arquivo);                               //libero o arquivo para ser sobreescrito
 close(arquivo);                                 //fecho o arquivo
 writeln('Pressione uma tecla para continuar.'); //escrevo na tela a mensagem 'Pressione uma tecla para continuar.'
 readln;                                         //espero que seja pressionada uma tecla
 //clrscr;                                         //limpo a tela
END;                                             //finalizo a procedure inicializa

Procedure regravaTudoNoArquivo;                  //procedimento para apagar todo conteúdo do arquivo e regravar o conteudo do array no arquivo
BEGIN                                            //inicio da procedure  regravaTudoNoArquivo
 inicializa;                                     //chamo a procedure inicializa para limpar o arquivo
 assign(arquivo,'c:\notas1.dat');                //coloco na variável 'arquivo' o texto que esta dentro do arquivo notas1.dat
 append(arquivo);                                //libero o arquivo para ser escrito dentro dele
 for i:=1 to cont do                             //inicializo um for de 1 até a quantidade de registros existentes no arquivo
 if i=quemAlterar then                           //inicio do if, caso não seja quem desejamos alterar
 begin                                           //inicio do if
  WRITELN(arquivo,nomeAlterado);                 //gravo no arquivo o nomeAlterado, caso a posição do laço for seja igual ao contador da volta informado pelo quemAlterar da linha 152
  WRITELN(arquivo,mediaAlterada:2:2);            //gravo no arquivo a mediaAlterada, caso a posição do laço for seja igual ao contador da volta informado pelo quemAlterar da linha 152
 end                                             //finalizo o if
 else 								    //caso contrario (do if da linha 32)
 begin                                           //inicio do caso contrario
   WRITELN(arquivo,nomes[i]);                    //gravo no arquivo o conteúdo original (nome) que foi gravado para ser assegurado sua reescrita
   WRITELN(arquivo,medias[i]:2:2);               //gravo no arquivo o conteúdo original (media) que foi gravado para ser assegurado sua reescrita
 end;                                            //fim do caso contrario
 close(arquivo); 						    //fecho o arquivo
 writeln('Pressione uma tecla para continuar.'); //escrevo na tela a mensagem 'Pressione uma tecla para continuar.'
 readln;                                         //espero que seja pressionada uma tecla
 clrscr;                                         //limpo a tela
END;                                             //fim da procedure regravaTudoNoArquivo

Procedure cadastra; 					    //procedimento que obtém os dados digitados no teclado e os salva no arquivo
BEGIN                                            //inicio da procedure cadastra

 for j:=2 to 78 do
 begin
  for i:=2 to 24 do
  begin
   gotoxy(j,i);
   textcolor (green);
   write(chr(219));
  end;
 end;
 textbackground ( green );
 textcolor (black);
 gotoxy(3,2);
 assign(arquivo,'c:\notas1.dat');                //coloco na variável 'arquivo' o texto que esta dentro do arquivo notas1.dat
 append(arquivo);                                //libero o arquivo para ser escrito dentro dele
 gotoxy(3,3);
 writeln('DIGITE O NOME DO ALUNO:');             //informa na tela DIGITE O NOME DO ALUNO:
 gotoxy(3,4);
 READLN(nome);                                   //armazena o que foi digitado na variável NOME
 WRITELN('DIGITE A MEDIA FINAL DO ALUNO');       //informa na tela DIGITE A MEDIA FINAL DO ALUNO
 READLN(media); 						    //armazena o que foi digitado na variavel MEDIA
 CLRSCR;                                         //limpa a tela
 WRITELN(nome);                                  //informa na tela o conteúdo da variável NOME
 WRITELN(media:2:2); 					    //informa na tela o conteúdo da variavel MEDIA formatando com duas casas antes da virgula e duas casas depois da virgula, caso fosse desejado exibir 3 casas depois da vírgula usaríamos MEDIA:2:3
 readkey;								    //espero que seja pressionada uma tecla
 WRITELN(arquivo,nome);                          //escrevo no arquivo o conteudo da variável nome
 WRITELN(arquivo,media:2:2);				    //escrevo no arquivo o conteúdo a varivel media
 close(arquivo);						    //fecho o arquivo
 writeln('Pressione uma tecla para continuar.'); //escrevo na tela a mensagem 'Pressione uma tecla para continuar.'
 readln;                                         //espero que seja pressionada uma tecla
 clrscr;                                         //limpo a tela
END;                                             //fim da procedure cadastra

Procedure cadastraZerado; 				    //procedimento que alimenta o arquivo com todos os dados, exeto os dados do nome que desejamos excluir, esta procedure é muito semelhante ao regravaTudoNoArquivo
BEGIN                                            //inicio da procedure cadastraZerado
 for j:=2 to 78 do
 begin
  for i:=2 to 24 do
  begin
   gotoxy(j,i);
   textcolor (green);
   write(chr(219));
  end;
 end;
 textbackground ( green );
 textcolor (black);
 gotoxy(3,2);
 inicializa;                                     //chamo a procedure inicializa para limpar o arquivo
 assign(arquivo,'c:\notas1.dat');                //coloco na variável 'arquivo' o texto que esta dentro do arquivo notas1.dat
 append(arquivo);                                //libero o arquivo para ser escrito dentro dele
 for i:=1 to cont do 					    //inicializo um for de 1 até a quantidade de registros existentes no arquivo
 begin
  if i<>quemAlterar then					    //faço a comparação do contador do for que esta indicando a posição a ser lida, com a posição a ser alterada que foi definida na comparação do nome que o usuario digitou
  begin  	                       			    //inicio do if, caso não seja quem desejamos deletar
   WRITELN(arquivo,nomes[i]);	                   //gravamos no arquivo o nome que foi armazenado no vetor temporário
   WRITELN(arquivo,medias[i]:2:2);               //gravamos no arquivo o nome que foi armazenado no vetor temporário
  end;                                            //fim do if da linha 74
 end;
 close(arquivo);            				    //fecho o arquivo
 writeln('Pressione uma tecla para continuar.'); //escrevo na tela a mensagem 'Pressione uma tecla para continuar.'
 readln;								    //espero que seja pressionada uma tecla
 clrscr;                                         //limpo a tela
END;                                             //fim da procedure cadastraZerado

Procedure lista;                                 //procedimento que obtem os dados armazenados no arquivo e os lista na tela
BEGIN                                            //inicio da procedure lista
 for j:=2 to 78 do
 begin
  for i:=2 to 24 do
  begin
   gotoxy(j,i);
   textcolor (green);
   write(chr(219));
  end;
 end;
 textbackground ( green );
 textcolor (black);
 gotoxy(3,2);
 assign(arquivo,'c:\notas1.dat'); 			    //coloco na variável 'arquivo' o texto que esta dentro do arquivo notas1.dat
 reset(arquivo);                                 //libero o arquivo para ser escrito dentro dele
 clrscr;                                         //limpo a tela
 writeln('lista de alunos e notas');             //escrevo na tela a mensagem 'lista de alunos e notas'
 while not eof (arquivo) do                      //este comando while faz com que percorra-se o conteudo do arquivo, (eof=end of file), traduzindo -> while = enquanto, not = não, eof = fim de arquivo, do = faça....logo=enquanto nao for final de arquivo na variável 'arquivo' faça
 begin                                           //inicio do while
   readln(arquivo,nome);                         //leio linha por linha e pego a cada linha o seu conteúdo e armazeno na varivel nome
   readln(arquivo,media);                        //leio linha por linha e pego a cada linha o seu conteúdo e armazeno na varivel media
   writeln;                                      //passo para linha de baixo
   writeln('nome aluno: ',nome);                 //escrevo na tela o conteúdo a variável nome
   writeln('media aluno: ',media:2:2);           //escrevo na tela o conteúdo a variável media
 end;								    //fim do while
 close(arquivo);                                 //fecho o arquivo
 writeln('Pressione uma tecla para continuar.'); //escrevo na tela a mensagem 'Pressione uma tecla para continuar.'
 readln;                                         //espero que seja pressionada uma tecla
 clrscr;     							    //limpo a tela
END;                                             //fim da procedure lista

Procedure localiza;                              //procedimento que busca no arquivo um nome igual ao nome digitado e armazenado na varivel n
BEGIN                                            //inicio da procedure localiza
 clrscr;                                         //limpo a tela
 for j:=2 to 78 do
 begin
  for i:=2 to 24 do
  begin
   gotoxy(j,i);
   textcolor (green);
   write(chr(219));
  end;
 end;
 textbackground ( green );
 textcolor (black);
 gotoxy(3,2);

 writeln('Localizar'); 					    //escrevo na tela a mensagem 'Localizar'
 writeln('Entre com o nome:');                   //escrevo na tela a mensagem 'Entre com o nome:'
 readln(n);                                      //armazeno na variável n o que foi digitado pelo usuário.
 clrscr; 								    //limpo a tela
 assign(arquivo,'c:\notas1.dat');                //coloco na variável 'arquivo' o texto que esta dentro do arquivo notas1.dat
 reset(arquivo);                                 //libero o arquivo para escrita
 writeln('Resultado da busca');                  //escrevo na tela a mensagem '
 while not eof (arquivo) do                      //este comando while faz com que percorra-se o conteudo do arquivo, (eof=end of file), traduzindo -> while = enquanto, not = não, eof = fim de arquivo, do = faça....logo=enquanto nao for final de arquivo na variável 'arquivo' faça
 begin                                           //inicio o while
  readln(arquivo,nome);                          //leio linha por linha e pego a cada linha o seu conteúdo e armazeno na varivel nome
  readln(arquivo,media);                         //leio linha por linha e pego a cada linha o seu conteúdo e armazeno na varivel media
  if nome = n then                               //caso o valor da variável nome seja igual ao valor digitado pelo usuário armazanado na varivel n (isso é feito na linha 110)
  begin                                          //inicio o if
   writeln('nome aluno: ',nome);			    //imprimimos na tela o valor da variável nome
   writeln('media aluno: ',media:2:2);           //imprimimos na tela o valor da variável media
  end;                                           //fim do if
 end;                                            //fim do while
 close(arquivo);                                 //fecho o arquivo
 writeln('Pressione uma tecla para continuar.'); //escrevo na tela a mensagem 'Pressione uma tecla para continuar.'
 readln;                                         //espero que seja pressionada uma tecla
 clrscr; 			                             //limpo a tela
END;                                             //fim da procedure localiza

PROCEDURE altera;						    //procedimento que busca no arquivo por um nome conforme digitado no conteúdo da variável n e armazena sua posição, ao mesmo tempo faz uma copia do conteúdo já existente no arquivo para uma futura reescrita do arquivo.
BEGIN                                            //inicio da procedure altera
 clrscr;                                         //limpo a tela
 for j:=2 to 78 do
 begin
  for i:=2 to 24 do
  begin
   gotoxy(j,i);
   textcolor (green);
   write(chr(219));
  end;
 end;
 textbackground ( green );
 textcolor (black);
 gotoxy(3,2);
 writeln('Alterar'); 					    //escrevo na tela a mensagem 'Alterar'
 writeln('Entre com o nome:'); 			    //escrevo na tela a mensagem 'Entre com o nome:'
 readln(n);                                      //armazeno na variável n o que foi digitado pelo usuário.
  clrscr; 							    //limpo a tela
  assign(arquivo,'c:\notas1.dat');               //coloco na variável 'arquivo' o texto que esta dentro do arquivo notas1.dat
  reset(arquivo);                                //libera o arquivo para escrita
  writeln('Resultado da busca para alterar');    //escrevo na tela a mensagem 'Resultado da busca para alterar.'
  cont:=0;                                       //inicializo o contador cont
  while not eof (arquivo) do				    //este comando while faz com que percorra-se o conteudo do arquivo, (eof=end of file), traduzindo -> while = enquanto, not = não, eof = fim de arquivo, do = faça....logo=enquanto não for final de arquivo na variável 'arquivo' faça
  begin                                          //inicio do while
   cont:=cont+1;  	                             //a cada volta do while o contador cont é incrementado
   readln(arquivo,nome);                         //leio linha por linha e pego a cada linha o seu conteúdo e armazeno na varivel nome
   readln(arquivo,media);                        //leio linha por linha e pego a cada linha o seu conteúdo e armazeno na varivel media
   nomes[cont]:=nome;                            //em cada volta do while armazeno no array nome na posição correspondente o conteúdo que esta na variável nome (esta por sua vez foi alimentada pelo conteúdo vindo do arquivo na linha 145)
   medias[cont]:=media;                          //em cada volta do while armazeno no array media na posição correspondente o conteudo que esta na varivel media (esta por sua vez foi alimentada pelo conteúdo vindo do arquivo na linha 146)
   if nome = n then                              //caso o conteúdo da variável nome seja igual ao conteúdo da varivel n (obtida atravez do teclado na linha 136)
   begin                                         //inicio o if
    quemAlterar:=cont;                           //armazeno na variável quemAlterar o numero da posição do registro a ser alterado
    writeln('nome aluno: ',nome);  		    //e imprimimos na tela o valor da variável nome
    writeln('media aluno: ',media:2:2);          //e imprimimos na tela o valor da variável media
    writeln ('Digite o novo Nome');              //escrevo na tela a mensagem 'Digite o novo Nome'
    readln(nomeAlterado);                        //armazeno na variável nomeAlterado o que for digitado no teclado
    writeln('Digite a nova Media');              //escrevo na tela a mensagem 'Digite a nova Media'
    readln (mediaAlterada);                      //armazeno na variável nomeAlterado o que for digitado no teclado
   end;                                          //fim do if
  end;								    //fim do while
 close(arquivo);                                 //fecho o arquivo
 regravaTudoNoArquivo;                           //chamo a procedure regravaTudoNoArquivo
 writeln('Pressione uma tecla para continuar.'); //escrevo na tela a mensagem 'Pressione uma tecla para continuar.'
 readln;                                         //espero que seja pressionada uma tecla
 clrscr;								    //limpo a tela
END;                                             //fim a procedure altera

PROCEDURE exclui;						    //procedimento que busca no arquivo
BEGIN                                            //inicio da procedure exclui
clrscr;                                          //limpo a tela
for j:=2 to 78 do
 begin
  for i:=2 to 24 do
  begin
   gotoxy(j,i);
   textcolor (green);
   write(chr(219));
  end;
 end;
 textbackground ( green );
 textcolor (black);
 gotoxy(3,2);
writeln('Excluir'); 			  		    //escrevo na tela a mensagem 'Excluir'
n:='';
writeln('Entre com o nome:');  			    //escrevo na tela a mensagem '
readln(n);                                       //armazeno na variável n o que foi digitado pelo usuário.
 clrscr;   							    //limpo a tela
 assign(arquivo,'c:\notas1.dat');                //coloco na variável 'arquivo' o texto que esta dentro do arquivo notas1.dat
 reset(arquivo);                                 //libero o arquivo para ser sobreescrito
 writeln('Resultado da busca para excluir');     //escrevo na tela a mensagem 'Resultado da busca para excluir.'
 cont:=0;                                        //inicializo o contador cont
 while not eof (arquivo) do				    //este comando while faz com que percorra-se o conteudo do arquivo, (eof=end of file), traduzindo -> while = enquanto, not = não, eof = fim de arquivo, do = faça....logo=enquanto nao for final de arquivo na variável 'arquivo' faça
 begin                                           //inicio do while
  cont:=cont+1;  	                             //a cada volta do while o contador cont é incrementado
  nome:='';
  readln(arquivo,nome);                          //leio linha por linha e pego a cada linha o seu conteúdo e armazeno na variável nome
  readln(arquivo,media);                         //leio linha por linha e pego a cada linha o seu conteúdo e armazeno na variável media
  nomes[cont]:=nome;                             //em cada volta do while armazeno no array nome na posição correspondente o conteúdo que esta na varivel nome (esta por sua vez foi alimentada pelo conteúdo vindo do arquivo na linha 181)
  medias[cont]:=media;                           //em cada volta do while armazeno no array media na posição correspondente o conteúdo que esta na varivel media (esta por sua vez foi alimentada pelo conteúdo vindo do arquivo na linha 182)
  if nome = n then                               //caso o conteúdo da variável nome seja igual ao conteudo da variável n (obtida através do teclado na linha 172)
  begin                                          //inicio do if
   quemAlterar:=cont;                            //armazeno na varivel quemAlterar o numero da posição do registro a ser alterado
   writeln('nome aluno: ',nome);   	         //imprimimos na tela o valor da varivel nome
   writeln('media aluno: ',media:2:2); 		    //imprimimos na tela o valor da variável media
  end;                                           //fim do if
 end;                                            //fim do while
 close(arquivo);                                 //fecho o arquivo
 cadastraZerado;                                 //chamo a procedure cadastraZerado
 writeln('Pressione uma tecla para continuar.'); //escrevo na tela a mensagem 'Pressione uma tecla para continuar.'
 readln;                                         //espero que seja pressionada uma tecla
 clrscr;   							    //limpo a tela
END;                                             //fim a procedure
Begin 								    //inicio do programa
 repeat                                          //repetir
 janela;
 writeln('0-Inicializar');				    //apenas escrevemos na tela a legenda do menu 0, cuidado com o '0' este chama o procedimento que cria um arquivo novo!
 gotoxy(35,5);
 writeln('1-Cadastrar');           		    //apenas escrevemos na tela a legenda do menu 1
 gotoxy(35,6);
 writeln('2-Localizar');           		    //apenas escrevemos na tela a legenda do menu 2
 gotoxy(35,7);
 writeln('3-Listar');              		    //apenas escrevemos na tela a legenda do menu 3
 gotoxy(35,8);
 writeln('4-Alterar');             		    //apenas escrevemos na tela a legenda do menu 4
 gotoxy(35,9);
 writeln('5-Excluir');             		    //apenas escrevemos na tela a legenda do menu 5
 gotoxy(35,10);
 writeln('6-Finalizar');           		    //apenas escrevemos na tela a legenda do menu 6
 gotoxy(35,11);
 write('[');
 gotoxy(37,11);
 write(']');
 gotoxy(36,11);
 op:=readkey;                                    //armazeno ma variável 'op' o que for digitado no teclado
 gotoxy(36,11);
 write(op);
 case op of                                      //o comando case, permite que analisamos o conteúdo da variável op, caso seja uma das listadas abaixo, chamamos a procedure que atende a solicitação.
  '0': inicializa;
  '1': cadastra;
  '2': localiza;
  '3': lista;
  '4': altera;
  '5': exclui;
 end;								    //fim do case
 until op='6';                                   //este comando faz parte do 'repeat' e indica que a repetição deve ser feita até que seja pressionada a tecla '6'.
End.							              //fim do programa.

