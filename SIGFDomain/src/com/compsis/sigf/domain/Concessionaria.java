package com.compsis.sigf.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;

import br.com.compsis.sigf.util.IDUtils;
/**
 * Compsis
 * @author Lucas Israel
 * @see 04/08/2011
 * @version 1.1
 * 
 */
public class Concessionaria extends DomainObject implements Serializable, Replicable, IOrigem{
    private String phase;
    private List<Praca> pracas;
    private Malote configMalote;
    private ServidorBD servidorBD;
    private List<Categoria> categorias;
    private Arrecadacao configArrecadacao;
    private ConfigAcesso configuracaAcesso;
    private ConfiguracaoImagem configImagem;
    private List<MeioPagamento> meiosPagamento;
    private MotivoFechamentoPista motivoFechamento;
    private List<RelatorioConcessionaria> relatorios;
    private String nome, cnpj, calculoCatEspecialOutro;
    private List<FuncionalidadeConcessionaria> funcionalidades;
    private String link1, link2, capacidadeLink1, capacidadeLink2, textoTermoDivida;
    private int operacaoSA, calculoCatEspecial, percentCorrecaoAutoCatAmb, numeroCliente, numeroPais, origemNomeArquivo;
    private boolean categoriaAmbigua, correcaoAutomaticaCatAmbigua, exibirDescricaoPracaRelatorios, existeAVI, imprimirTermoDivida;
    
    public Concessionaria(){
    	motivoFechamento = new MotivoFechamentoPista();
    }
    public String getTextoTermoDivida() {
		return textoTermoDivida;
	}

	public void setTextoTermoDivida(String textoTermoDivida) {
		this.textoTermoDivida = textoTermoDivida;
	}

	public boolean isImprimirTermoDivida() {
		return imprimirTermoDivida;
	}

	public void setImprimirTermoDivida(boolean imprimirTermoDivida) {
		this.imprimirTermoDivida = imprimirTermoDivida;
	}

	private int anosEstimativaTrafego;
    
    public int getAnosEstimativaTrafego() {
		return anosEstimativaTrafego;
	}

	public void setAnosEstimativaTrafego(int anosEstimativaTrafego) {
		this.anosEstimativaTrafego = anosEstimativaTrafego;
	}
	
    public boolean isExisteAVI() {
		return existeAVI;
	}

	public void setExisteAVI(boolean existeAVI) {
		this.existeAVI = existeAVI;
	}
    
    public MotivoFechamentoPista getMotivoFechamento() {
		return motivoFechamento;
	}

	public void setMotivoFechamento(MotivoFechamentoPista motivoFechamento) {
		this.motivoFechamento = motivoFechamento;
	}
	
    public boolean possuiSGMP(){
        if(meiosPagamento!=null && !meiosPagamento.isEmpty()){
            for(MeioPagamento mp: meiosPagamento){
                if(mp!=null && (mp.getConfiguracao()==19 || mp.getConfiguracao()==20)){
                    return true;
                }
            }
        }
        return false;
    }

    /**
     * @return the pracas
     */
    public List<Praca> getPracas() {
        return pracas;
    }

    /**
     * @param pracas the pracas to set
     */
    public void setPracas(List<Praca> pracas) {
        this.pracas = pracas;
    }

    /**
     * @return the nome
     */
    public String getNome() {
        return nome;
    }

    /**
     * @param nome the nome to set
     */
    public void setNome(String nome) {
        this.nome = nome;
    }

    /**
     * @return the cnpj
     */
    public String getCnpj() {
        return cnpj;
    }

    /**
     * @param cnpj the cnpj to set
     */
    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }

    /**
     * @return the calculoCatEspecialOutro
     */
    public String getCalculoCatEspecialOutro() {
        return calculoCatEspecialOutro;
    }

    /**
     * @param calculoCatEspecialOutro the calculoCatEspecialOutro to set
     */
    public void setCalculoCatEspecialOutro(String calculoCatEspecialOutro) {
        this.calculoCatEspecialOutro = calculoCatEspecialOutro;
    }

    /**
     * @return the operacaoSA
     */
    public int getOperacaoSA() {
        return operacaoSA;
    }

    /**
     * @param operacaoSA the operacaoSA to set
     */
    public void setOperacaoSA(int operacaoSA) {
        this.operacaoSA = operacaoSA;
    }

    /**
     * @return the calculoCatEspecial
     */
    public int getCalculoCatEspecial() {
        return calculoCatEspecial;
    }

    /**
     * @param calculoCatEspecial the calculoCatEspecial to set
     */
    public void setCalculoCatEspecial(int calculoCatEspecial) {
        this.calculoCatEspecial = calculoCatEspecial;
    }

    /**
     * @return the categoriaAmbigua
     */
    public boolean isCategoriaAmbigua() {
        return categoriaAmbigua;
    }

    /**
     * @param categoriaAmbigua the categoriaAmbigua to set
     */
    public void setCategoriaAmbigua(boolean categoriaAmbigua) {
        this.categoriaAmbigua = categoriaAmbigua;
    }

    /**
     * @return the link1
     */
    public String getLink1() {
        return link1;
    }

    /**
     * @param link1 the link1 to set
     */
    public void setLink1(String link1) {
        this.link1 = link1;
    }

    /**
     * @return the link2
     */
    public String getLink2() {
        return link2;
    }

    /**
     * @param link2 the link2 to set
     */
    public void setLink2(String link2) {
        this.link2 = link2;
    }

    /**
     * @return the capacidadeLink1
     */
    public String getCapacidadeLink1() {
        return capacidadeLink1;
    }

    /**
     * @param capacidadeLink1 the capacidadeLink1 to set
     */
    public void setCapacidadeLink1(String capacidadeLink1) {
        this.capacidadeLink1 = capacidadeLink1;
    }

    /**
     * @return the capacidadeLink2
     */
    public String getCapacidadeLink2() {
        return capacidadeLink2;
    }

    /**
     * @param capacidadeLink2 the capacidadeLink2 to set
     */
    public void setCapacidadeLink2(String capacidadeLink2) {
        this.capacidadeLink2 = capacidadeLink2;
    }

    /**
     * @return the servidorBD
     */
    public ServidorBD getServidorBD() {
        return servidorBD;
    }

    /**
     * @param servidorBD the servidorBD to set
     */
    public void setServidorBD(ServidorBD servidorBD) {
        this.servidorBD = servidorBD;
    }

    /**
     * @return the categorias
     */
    public List<Categoria> getCategorias() {
        return categorias;
    }

    /**
     * @param categorias the categorias to set
     */
    public void setCategorias(List<Categoria> categorias) {
        this.categorias = categorias;
    }

    /**
     * @return the phase
     */
    public String getPhase() {
        return phase;
    }

    /**
     * @param phase the phase to set
     */
    public void setPhase(String phase) {
        this.phase = phase;
    }

    /**
     * @return the correcaoAutomaticaCatAmbigua
     */
    public boolean isCorrecaoAutomaticaCatAmbigua() {
        return correcaoAutomaticaCatAmbigua;
    }

    /**
     * @param correcaoAutomaticaCatAmbigua the correcaoAutomaticaCatAmbigua to set
     */
    public void setCorrecaoAutomaticaCatAmbigua(boolean correcaoAutomaticaCatAmbigua) {
        this.correcaoAutomaticaCatAmbigua = correcaoAutomaticaCatAmbigua;
    }

    /**
     * @return the percentCorrecaoAutoCatAmb
     */
    public int getPercentCorrecaoAutoCatAmb() {
        return percentCorrecaoAutoCatAmb;
    }

    /**
     * @param percentCorrecaoAutoCatAmb the percentCorrecaoAutoCatAmb to set
     */
    public void setPercentCorrecaoAutoCatAmb(int percentCorrecaoAutoCatAmb) {
        this.percentCorrecaoAutoCatAmb = percentCorrecaoAutoCatAmb;
    }

    /**
     * @return the configImagem
     */
    public ConfiguracaoImagem getConfigImagem() {
        return configImagem;
    }

    /**
     * @param configImagem the configImagem to set
     */
    public void setConfigImagem(ConfiguracaoImagem configImagem) {
        this.configImagem = configImagem;
    }

    /**
     * @return the meiosPagamento
     */
    public List<MeioPagamento> getMeiosPagamento() {
        return meiosPagamento;
    }

    /**
     * @param meiosPagamento the meiosPagamento to set
     */
    public void setMeiosPagamento(List<MeioPagamento> meiosPagamento) {
        this.meiosPagamento = meiosPagamento;
    }

    /**
     * @return the configArrecadacao
     */
    public Arrecadacao getConfigArrecadacao() {
        return configArrecadacao;
    }

    /**
     * @param configArrecadacao the configArrecadacao to set
     */
    public void setConfigArrecadacao(Arrecadacao configArrecadacao) {
        this.configArrecadacao = configArrecadacao;
    }

    /**
     * @return the configMalote
     */
    public Malote getConfigMalote() {
        return configMalote;
    }

    /**
     * @param configMalote the configMalote to set
     */
    public void setConfigMalote(Malote configMalote) {
        this.configMalote = configMalote;
    }

    /**
     * @return the numeroCliente
     */
    public int getNumeroCliente() {
        return numeroCliente;
    }

    /**
     * @param numeroCliente the numeroCliente to set
     */
    public void setNumeroCliente(int numeroCliente) {
        this.numeroCliente = numeroCliente;
    }

    /**
     * @return the numeroPais
     */
    public int getNumeroPais() {
        return numeroPais;
    }

    /**
     * @param numeroPais the numeroPais to set
     */
    public void setNumeroPais(int numeroPais) {
        this.numeroPais = numeroPais;
    }

    /**
     * @return the origemNomeArquivo
     */
    public int getOrigemNomeArquivo() {
        return origemNomeArquivo;
    }

    /**
     * @param origemNomeArquivo the origemNomeArquivo to set
     */
    public void setOrigemNomeArquivo(int origemNomeArquivo) {
        this.origemNomeArquivo = origemNomeArquivo;
    }

    /**
     * @return the exibirDescricaoPracaRelatorios
     */
    public boolean isExibirDescricaoPracaRelatorios() {
        return exibirDescricaoPracaRelatorios;
    }

    /**
     * @param exibirDescricaoPracaRelatorios the exibirDescricaoPracaRelatorios to set
     */
    public void setExibirDescricaoPracaRelatorios(boolean exibirDescricaoPracaRelatorios) {
        this.exibirDescricaoPracaRelatorios = exibirDescricaoPracaRelatorios;
    }

    @Override
    public Replicable replicate(Object o) {
        Concessionaria c = new Concessionaria();
        c.setId(null);
        c.setCalculoCatEspecial(calculoCatEspecial);
        c.setCalculoCatEspecialOutro(calculoCatEspecialOutro);
        c.setCapacidadeLink1(capacidadeLink1);
        c.setCapacidadeLink2(capacidadeLink2);
        c.setCategoriaAmbigua(categoriaAmbigua);
        c.setConfiguracaAcesso((ConfigAcesso)configuracaAcesso.replicate(c));
        
        List<Categoria> listaCat = new ArrayList<Categoria>();
        for(Categoria ct : getCategorias()){
            if(ct!=null){
                listaCat.add((Categoria)ct.replicate(c));
            }
        }
        c.setCategorias(listaCat);
        c.setCnpj("");
        c.setConfigArrecadacao((Arrecadacao)configArrecadacao.replicate(c));
        c.setConfigImagem((ConfiguracaoImagem)configImagem.replicate(c));
        c.setConfigMalote((Malote)configMalote.replicate(c));
        c.setCorrecaoAutomaticaCatAmbigua(correcaoAutomaticaCatAmbigua);
        c.setExibirDescricaoPracaRelatorios(exibirDescricaoPracaRelatorios);
        
        
        c.setMeiosPagamento(meiosPagamento);
        List<MeioPagamento> listaMP = new ArrayList<MeioPagamento>();
        for(MeioPagamento mp : getMeiosPagamento()){
            if(mp!=null){
                listaMP.add((MeioPagamento)mp.replicate(c));
            }
        }
        c.setMeiosPagamento(listaMP);
        
        c.setLink1(link1);
        c.setLink2(link2);
        c.setNome(nome);
        c.setNumeroCliente(numeroCliente);
        c.setNumeroPais(numeroPais);
        c.setOperacaoSA(operacaoSA);
        c.setExibirDescricaoPracaRelatorios(exibirDescricaoPracaRelatorios);
        c.setAnosEstimativaTrafego(anosEstimativaTrafego);
        c.setOrigemNomeArquivo(origemNomeArquivo);
        c.setPercentCorrecaoAutoCatAmb(percentCorrecaoAutoCatAmb);
        c.setServidorBD((ServidorBD)servidorBD.replicate(c));
        
        List<Praca> listaPR = new ArrayList<Praca>();
        for(Praca pc : getPracas()){
            if(pc!=null){
                listaPR.add((Praca)pc.replicate(c));
            }
        }
        c.setPracas(listaPR);
        
        return c;
    }

    /**
     * @return the relatorios
     */
    public List<RelatorioConcessionaria> getRelatorios() {
        return relatorios;
    }

    /**
     * @param relatorios the relatorios to set
     */
    public void setRelatorios(List<RelatorioConcessionaria> relatorios) {
        this.relatorios = relatorios;
    }

    /**
     * @return the configuracaAcesso
     */
    public ConfigAcesso getConfiguracaAcesso() {
        return configuracaAcesso;
    }

    /**
     * @param configuracaAcesso the configuracaAcesso to set
     */
    public void setConfiguracaAcesso(ConfigAcesso configuracaAcesso) {
        this.configuracaAcesso = configuracaAcesso;
    }

    /**
     * @return the funcionalidades
     */
    public List<FuncionalidadeConcessionaria> getFuncionalidades() {
        return funcionalidades;
    }

    /**
     * @param funcionalidades the funcionalidades to set
     */
    public void setFuncionalidades(List<FuncionalidadeConcessionaria> funcionalidades) {
        this.funcionalidades = funcionalidades;
    }
    
    public int getIdioma(){
    	return numeroPais;
    }
	@Override
	public Integer getIdOrigem() {
		String idorigem = IDUtils.IdOrigem.getIdOrigem(this);
		return idorigem!=null?Integer.parseInt(idorigem):null;
	}
	@Override
	public Integer getTipoOrigem() {
		return Integer.valueOf(1);
	}
	@Override
	public String getDescricao() {
		return this.getNome();
	}
	@Override
	public Integer getPracaOrigem() {
		return null;
	}
	@Override
	public Integer getLocalizacaoOrigem() {
		return null;
	}
	@Override
	public Integer getPistaOrigem() {
		return null;
	}
	@Override
	public Integer getSentidoOrigem() {
		return null;
	}
	@Override
	public Integer getNumeroCabine() {
		return null;
	}
	@Override
	public Integer getIdOrigemPai() {
		return null;
	}
	@Override
	public Integer getTipoPistaArrecadacao() {
		return null;
	}
	@Override
	public Integer getFlagOperacao() {
		return null;
	}
	@Override
	public Integer getAtiva() {
		return null;
	}
	
	
	public String toString(){
		return new Gson().toJson(this);
	}
}
