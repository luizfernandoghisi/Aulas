programa {
    cadeia juizNome
    real juizAltura
    logico juizCertificacao
    cadeia juizNivelExperiencia
	    
    funcao vazio DefinirJuiz(cadeia nome, real altura, logico isCertificado, cadeia nivelExperiencia) {
        juizNome = nome
        juizAltura = altura
        juizCertificacao = isCertificado
        juizNivelExperiencia = nivelExperiencia
    }
    
    caracter bolaPresente
	caracter juizPresente 
	logico isEntradaDeDados = falso
	
	funcao vazio EntraDadosUsuario () {
	    escreva("Trouxeram a bola? - Responsa S para sim e N para não: ")
		leia(bolaPresente)
		
		
	    escreva("O juiz está em campo? - Responda S para sim e N para não: ")
		leia(juizPresente)
	}
	
   funcao logico ValidarEntrada(caracter isBola, caracter isJuiz) {
        se((isBola == 'S' ou isBola == 's' ou isBola == 'N' ou isBola == 'n') e (isJuiz == 'S' ou isJuiz == 's' ou isJuiz == 'N' ou isJuiz == 'n')){
            retorne verdadeiro
        }
        senao {
            retorne falso
        }
    }
    
    funcao vazio ConfereDadosErrados(caracter isBola, caracter isJuiz, logico isEntrada) {
        enquanto(isEntrada == falso){
		    escreva("\nNão são aceitos caracteres diferentes de S para sim ou N para não. Tente novamente.")
		    EntraDadosUsuario()
		    isEntrada = ValidarEntrada(bolaPresente, juizPresente)
		}
    }
    
    
    funcao vazio FinalizaPartida(inteiro cronometro, logico isPartidaIniciada, inteiro tempoDePartida) {
        se (isPartidaIniciada == verdadeiro){
            escreva("Partida finalizada com sucesso! Tempo de jogo: ", cronometro/60, " min\n")
		    escreva("Dados do juiz que apitou o jogo:\n", " Nome: ", juizNome, "\n Altura: ", juizAltura, "\n Certificado pela FIFA? ", juizCertificacao, "\n Nivel de Experiencia: ", juizNivelExperiencia)
        }
        senao {
            escreva("\nErro. A partida não foi iniciada.")
        }
    }
        
	funcao inicio() {
	    DefinirJuiz("Sr. Carrasco", 1.80, verdadeiro, "Alto")
	    
	    inteiro cronometro = 0
	    inteiro tempoDePartida = 6600
	    logico partidaIniciada = falso
	    
	   
	   faca {
	        EntraDadosUsuario()
            isEntradaDeDados = ValidarEntrada(bolaPresente, juizPresente)
            ConfereDadosErrados(bolaPresente, juizPresente, isEntradaDeDados)
            
	   } enquanto (isEntradaDeDados = falso)
		
		se (bolaPresente == 'N' ou bolaPresente == 'n') {
		    escreva("Não é possível jogar sem bola!")
		}
		senao se (juizPresente == 'N' ou juizPresente == 'n') {
		    escreva("Não é permitido iniciar uma partida sem juiz!")
		}
		senao {
		    partidaIniciada = verdadeiro
		}
		
		se(partidaIniciada == verdadeiro) {
		    faca{
		        cronometro = cronometro + 1
		    } enquanto(cronometro < tempoDePartida)
		    
		    FinalizaPartida(cronometro, partidaIniciada, tempoDePartida)
		}
    }
}
