package com.compsis.sigf.domain;

/**
 *
 * @author Lucas Israel
 */
public class Relatorio extends DomainObject implements Replicable{
    private int idrelatorio, horasDesnvolvimento, horasHomologacao, valorPercebido, idGrupo, listaRelatorio, usebean;
    private String titulo, descricao, classificacao, comentario, versao, arquivo;
    private String relatorioClass, arquivoDetalhe;

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 17 * hash + this.idrelatorio;
        hash = 17 * hash + (this.arquivo != null ? this.arquivo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Relatorio other = (Relatorio) obj;
        if (this.idrelatorio != other.idrelatorio) {
            return false;
        }
        if ((this.arquivo == null) ? (other.arquivo != null) : !this.arquivo.equals(other.arquivo)) {
            return false;
        }
        return true;
    }
    
    /**
     * @return the idrelatorio
     */
    public int getIdrelatorio() {
        return idrelatorio;
    }

    /**
     * @param idrelatorio the idrelatorio to set
     */
    public void setIdrelatorio(int idrelatorio) {
        this.idrelatorio = idrelatorio;
    }

    /**
     * @return the horasDesnvolvimento
     */
    public int getHorasDesnvolvimento() {
        return horasDesnvolvimento;
    }

    /**
     * @param horasDesnvolvimento the horasDesnvolvimento to set
     */
    public void setHorasDesnvolvimento(int horasDesnvolvimento) {
        this.horasDesnvolvimento = horasDesnvolvimento;
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
     * @return the idGrupo
     */
    public int getIdGrupo() {
        return idGrupo;
    }

    /**
     * @param idGrupo the idGrupo to set
     */
    public void setIdGrupo(int idGrupo) {
        this.idGrupo = idGrupo;
    }

    /**
     * @return the listaRelatorio
     */
    public int getListaRelatorio() {
        return listaRelatorio;
    }

    /**
     * @param listaRelatorio the listaRelatorio to set
     */
    public void setListaRelatorio(int listaRelatorio) {
        this.listaRelatorio = listaRelatorio;
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
     * @return the versao
     */
    public String getVersao() {
        return versao;
    }

    /**
     * @param versao the versao to set
     */
    public void setVersao(String versao) {
        this.versao = versao;
    }

    /**
     * @return the arquivo
     */
    public String getArquivo() {
        return arquivo;
    }

    /**
     * @param arquivo the arquivo to set
     */
    public void setArquivo(String arquivo) {
        this.arquivo = arquivo;
    }

    @Override
    public Replicable replicate(Object o) {
        Relatorio r = new Relatorio();
        r.setArquivo(arquivo);
        r.setClassificacao(classificacao);
        r.setComentario(comentario);
        r.setDescricao(descricao);
        r.setHorasDesnvolvimento(horasDesnvolvimento);
        r.setHorasHomologacao(horasHomologacao);
        r.setId(null);
        r.setIdGrupo(idGrupo);
        r.setIdrelatorio(idrelatorio);
        r.setListaRelatorio(listaRelatorio);
        r.setTitulo(titulo);
        r.setValorPercebido(valorPercebido);
        r.setVersao(versao);
        return r;
    }

    /**
     * @return the usebean
     */
    public int getUsebean() {
        return usebean;
    }

    /**
     * @param usebean the usebean to set
     */
    public void setUsebean(int usebean) {
        this.usebean = usebean;
    }

    /**
     * @return the relatorioClass
     */
    public String getRelatorioClass() {
        return relatorioClass;
    }

    /**
     * @param relatorioClass the relatorioClass to set
     */
    public void setRelatorioClass(String relatorioClass) {
        this.relatorioClass = relatorioClass;
    }

    /**
     * @return the arquivoDetalhe
     */
    public String getArquivoDetalhe() {
        return arquivoDetalhe;
    }

    /**
     * @param arquivoDetalhe the arquivoDetalhe to set
     */
    public void setArquivoDetalhe(String arquivoDetalhe) {
        this.arquivoDetalhe = arquivoDetalhe;
    }
}
