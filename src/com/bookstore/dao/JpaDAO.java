package com.bookstore.dao;

import javax.persistence.EntityManager;

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

}
