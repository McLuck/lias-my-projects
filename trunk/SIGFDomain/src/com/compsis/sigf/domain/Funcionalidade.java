package com.compsis.sigf.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;

/**
 *
 * @author Lucas Israel
 */
public class Funcionalidade extends DomainObject implements Replicable, Serializable {
    
    public static final Integer[] FUNCIONALIDADES_OPCIONAIS = {
        15,23,26,27,84,85,61,62,76,103,77,78,79,
        86,87,88,1088,89,90,95,97,101,105,106,
        107,108,110,111,112,113,114,115,109,121,
        122,123,124,126,127,128,129,130,131,1136,
        132,133,1150,1153,
        1154,3013,1114,1115,1116,3014,3015,3016
    };
    
    public String toString(){
		return new Gson().toJson(this, Funcionalidade.class);
	}

    private String titulo, descricao, classificacao, comentario, funcionalidades, preferencias, metodos, caminhoMenu;
    private int horasDesenvolvimento, horasHomologacao, valorPercebido, idFuncionalidade, acessivel;
    private List<PapelFuncionalidade> papelFuncionalidades;
    private List<FuncionalidadeAcesso> funcionalidadeAcessos;

    @Override
    public Replicable replicate(Object o) {
        Funcionalidade fun = new Funcionalidade();
        fun.setId(null);
        fun.setClassificacao(classificacao);
        fun.setComentario(comentario);
        fun.setDescricao(descricao);
        fun.setHorasDesenvolvimento(horasDesenvolvimento);
        fun.setHorasHomologacao(horasHomologacao);
        fun.setTitulo(titulo);
        fun.setValorPercebido(valorPercebido);
        fun.setMetodos(metodos);
        fun.setCaminhoMenu(caminhoMenu);
        fun.setIdFuncionalidade(idFuncionalidade);
        fun.setAcessivel(acessivel);
        return fun;
    }

    /**
     * @return the titulo
     */
    public String getTitulo() {
        return titulo;
    }

    /**
     * @param titulo the titulo to set
     */
    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    /**
     * @return the descricao
     */
    public String getDescricao() {
        return descricao;
    }

    /**
     * @param descricao the descricao to set
     */
    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    /**
     * @return the classificacao
     */
    public String getClassificacao() {
        return classificacao;
    }

    /**
     * @param classificacao the classificacao to set
     */
    public void setClassificacao(String classificacao) {
        this.classificacao = classificacao;
    }

    /**
     * @return the comentario
     */
    public String getComentario() {
        return comentario;
    }

    /**
     * @param comentario the comentario to set
     */
    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    /**
     * @return the horasDesenvolvimento
     */
    public int getHorasDesenvolvimento() {
        return horasDesenvolvimento;
    }

    /**
     * @param horasDesenvolvimento the horasDesenvolvimento to set
     */
    public void setHorasDesenvolvimento(int horasDesenvolvimento) {
        this.horasDesenvolvimento = horasDesenvolvimento;
    }

    /**
     * @return the horasHomologacao
     */
    public int getHorasHomologacao() {
        return horasHomologacao;
    }

    /**
     * @param horasHomologacao the horasHomologacao to set
     */
    public void setHorasHomologacao(int horasHomologacao) {
        this.horasHomologacao = horasHomologacao;
    }

    /**
     * @return the valorPercebido
     */
    public int getValorPercebido() {
        return valorPercebido;
    }

    /**
     * @param valorPercebido the valorPercebido to set
     */
    public void setValorPercebido(int valorPercebido) {
        this.valorPercebido = valorPercebido;
    }

    /**
     * @return the funcionalidades
     */
    public String getFuncionalidades() {
        return funcionalidades;
    }

    /**
     * @param funcionalidades the funcionalidades to set
     */
    public void setFuncionalidades(String funcionalidades) {
        this.funcionalidades = funcionalidades;
    }

    /**
     * @return the preferencias
     */
    public String getPreferencias() {
        return preferencias;
    }

    /**
     * @param preferencias the preferencias to set
     */
    public void setPreferencias(String preferencias) {
        this.preferencias = preferencias;
    }

    /**
     * @return the metodos
     */
    public String getMetodos() {
        return metodos;
    }

    /**
     * @param metodos the metodos to set
     */
    public void setMetodos(String metodos) {
        this.metodos = metodos;
    }

    /**
     * @return the caminhoMenu
     */
    public String getCaminhoMenu() {
        return caminhoMenu;
    }

    /**
     * @param caminhoMenu the caminhoMenu to set
     */
    public void setCaminhoMenu(String caminhoMenu) {
        this.caminhoMenu = caminhoMenu;
    }

    /**
     * @return the idFuncionalidade
     */
    public int getIdFuncionalidade() {
        return idFuncionalidade;
    }

    /**
     * @param idFuncionalidade the idFuncionalidade to set
     */
    public void setIdFuncionalidade(int idFuncionalidade) {
        this.idFuncionalidade = idFuncionalidade;
    }

    /**
     * @return the acessivel
     */
    public int getAcessivel() {
        return acessivel;
    }

    /**
     * @param acessivel the acessivel to set
     */
    public void setAcessivel(int acessivel) {
        this.acessivel = acessivel;
    }

    /**
     * @return the papelFuncionalidades
     */
    public List<PapelFuncionalidade> getPapelFuncionalidades() {
        if(funcionalidades==null || funcionalidades.isEmpty() || funcionalidades.trim().toUpperCase().equals("NA")){
            return null;
        }
        papelFuncionalidades = new ArrayList<PapelFuncionalidade>();
//        String vt[] = funcionalidades.split(",");
//        PapelFuncionalidadeDAO pfdao = (PapelFuncionalidadeDAO) AFactoryDao.getInstance(PapelFuncionalidadeDAO.class);
//        for(String s : vt){
//            papelFuncionalidades.addAll(pfdao.getByFuncionalidade(Integer.parseInt(s)));
//        }
//        pfdao.close();
        return papelFuncionalidades;
    }

    /**
     * @param papelFuncionalidades the papelFuncionalidades to set
     */
    public void setPapelFuncionalidades(List<PapelFuncionalidade> papelFuncionalidades) {
        this.papelFuncionalidades = papelFuncionalidades;
    }

    /**
     * @return the funcionalidadeAcessos
     */
    public List<FuncionalidadeAcesso> getFuncionalidadeAcessos() {
        if(funcionalidades==null || funcionalidades.isEmpty() || funcionalidades.trim().toUpperCase().equals("NA")){
            return null;
        }
        String vt[] = funcionalidades.split(",");
//        FuncionalidadeAcessoDAO fadao = (FuncionalidadeAcessoDAO) AFactoryDao.getInstance(FuncionalidadeAcessoDAO.class);
//        funcionalidadeAcessos = new ArrayList<FuncionalidadeAcesso>();
//        for(String s : vt){
//            List<FuncionalidadeAcesso> temp = fadao.getByFuncionalidade(Integer.parseInt(s));
//            funcionalidadeAcessos.addAll(temp);
//        }
//        fadao.close();
        return funcionalidadeAcessos;
    }
    
    /**
     * @param funcionalidadeAcessos the funcionalidadeAcessos to set
     */
    public void setFuncionalidadeAcessos(List<FuncionalidadeAcesso> funcionalidadeAcessos) {
        this.funcionalidadeAcessos = funcionalidadeAcessos;
    }

}
