package com.bookstore.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

public class JpaDAO<E> {

	protected EntityManager entityManager;

	public JpaDAO(EntityManager entitymanager) {
		super();
		this.entityManager = entitymanager;
	}

	public E create(E entity){

		entityManager.getTransaction().begin();

		entityManager.persist(entity);
		entityManager.flush();
		entityManager.refresh(entity);

		entityManager.getTransaction().commit();

		return entity;
	}
	
	public E update(E entity){
		entityManager.getTransaction().begin();
		
		entity = entityManager.merge(entity);
		entityManager.flush();

		entityManager.getTransaction().commit();
		
		return entity;
	}
	
	
	public E find(Class<E> type, Object id) {
		E entity = entityManager.find(type,id);
		if(entity != null) {
			entityManager.refresh(entity);
		}
		return entity;
	}
	
	public void delete(Class<E> type, Object id) {
		entityManager.getTransaction().begin();
		
		Object reference = entityManager.getReference(type, id);
		entityManager.remove(reference);
		
		entityManager.getTransaction().commit();
		
	}
	
	@SuppressWarnings("unchecked")
	public List<E> findWithNamedQuery(String queryName){
		Query query = entityManager.createNamedQuery(queryName);
		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<E> findWithNamedQuery(String queryName, String paramName, String paramValue){
		Query query = entityManager.createNamedQuery(queryName);
		
		query.setParameter(paramName, paramValue);
		return query.getResultList();
	}
	
	public long countWithNamedQuery(String queryName){
		//Class
		Query query = entityManager.createNamedQuery(queryName);
		//Switch to Long Type
		return (long) query.getSingleResult();
	}

}
