programa {
        cadeia juizNome
	    real juizAltura
	    logico juizCertificacao
	    cadeia juizNivelExperiencia
	    
    funcao vazio DefinirJuiz(cadeia nome, real altura, logico isCertificado, cadeia nivelExperiencia){
        juizNome = nome
        juizAltura = altura
        juizCertificacao = isCertificado
        juizNivelExperiencia = nivelExperiencia
    }
    
    funcao logico IniciaPartida(){
        retorne verdadeiro
    }
    funcao logico FinalizaPartida(inteiro cronometro, logico isPartidaIniciada, inteiro tempoDePartida){
        se (isPartidaIniciada == verdadeiro e cronometro > tempoDePartida){
            retorne verdadeiro
        }
        senao{
            retorne falso
        }
    }
        
	funcao inicio() {
	    DefinirJuiz("Sr. Carrasco", 1.80, verdadeiro, "Alto")
	    
	    //variaveis de Jogo
	    inteiro cronometro = 0
	    inteiro tempoDePartida = 6600
	    caracter juizPresente
	    caracter bolaPresente
	    logico partidaIniciada = falso
	   
	    escreva("Trouxeram a bola? - Responsa S para sim e N para não: ")
		leia(bolaPresente)
		
	    escreva("O juiz está em campo? - Responda S para sim e N para não: ")
		leia(juizPresente)
		
		se (bolaPresente == 'N'){
		    escreva("Não é possível jogar sem bola!")
		}
		senao se (juizPresente == 'N'){
		    escreva("Não é permitido iniciar uma partida sem juiz!")
		}
		senao{
		    partidaIniciada = IniciaPartida()
		}
		se(partidaIniciada == verdadeiro){
		    faca{
		        cronometro = cronometro + 1
		    } enquanto(cronometro < tempoDePartida)
		    
		    FinalizaPartida(cronometro, partidaIniciada, tempoDePartida)
		    escreva("Partida finalizada com sucesso! Tempo de jogo: ", cronometro/60, " min\n")
		    escreva("Dados do juiz que apitou o jogo:\n", " Nome: ", juizNome, "\n Altura: ", juizAltura, "\n Certificado pela FIFA? ", juizCertificacao, "\n Nivel de Experiencia: ", juizNivelExperiencia)
		}
	}
}
