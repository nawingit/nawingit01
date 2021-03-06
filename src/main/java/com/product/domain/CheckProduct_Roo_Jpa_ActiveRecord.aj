// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.product.domain;

import com.product.domain.CheckProduct;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CheckProduct_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager CheckProduct.entityManager;
    
    public static final List<String> CheckProduct.fieldNames4OrderClauseFilter = java.util.Arrays.asList("Name", "Numbers");
    
    public static final EntityManager CheckProduct.entityManager() {
        EntityManager em = new CheckProduct().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long CheckProduct.countCheckProducts() {
        return entityManager().createQuery("SELECT COUNT(o) FROM CheckProduct o", Long.class).getSingleResult();
    }
    
    public static List<CheckProduct> CheckProduct.findAllCheckProducts() {
        return entityManager().createQuery("SELECT o FROM CheckProduct o", CheckProduct.class).getResultList();
    }
    
    public static List<CheckProduct> CheckProduct.findAllCheckProducts(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM CheckProduct o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, CheckProduct.class).getResultList();
    }
    
    public static CheckProduct CheckProduct.findCheckProduct(Long id) {
        if (id == null) return null;
        return entityManager().find(CheckProduct.class, id);
    }
    
    public static List<CheckProduct> CheckProduct.findCheckProductEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM CheckProduct o", CheckProduct.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<CheckProduct> CheckProduct.findCheckProductEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM CheckProduct o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, CheckProduct.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void CheckProduct.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void CheckProduct.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            CheckProduct attached = CheckProduct.findCheckProduct(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void CheckProduct.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void CheckProduct.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public CheckProduct CheckProduct.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        CheckProduct merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
