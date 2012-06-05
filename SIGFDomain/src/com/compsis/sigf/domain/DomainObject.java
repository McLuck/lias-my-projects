
package com.compsis.sigf.domain;

import java.io.Serializable;

/**
 * Compsis
 * @author Lucas Israel
 * @see 05/08/2011
 * @version 1.0
 * 
 */
public class DomainObject implements Serializable{
    private Integer id;
    
    @Override
    public int hashCode(){
        return id;
    }

    @Override
    public boolean equals(Object obj) {
    	return (obj!=null && obj instanceof DomainObject && ((DomainObject)obj).getId().equals(id));
    }

    /**
     * @return the id
     */
    public Integer getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(Integer id) {
        this.id = id;
    }
}
