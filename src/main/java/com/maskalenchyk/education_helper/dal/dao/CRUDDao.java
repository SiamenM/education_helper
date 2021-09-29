package com.maskalenchyk.education_helper.dal.dao;

import com.maskalenchyk.education_helper.entity.Entity;

import java.util.List;

public interface CRUDDao<T extends Entity, ID> {

    T save (T entity) throws DaoException;

    void update (T entity) throws DaoException;

    void delete (T entity) throws DaoException;

    T findById (ID id) throws DaoException;

    List<T> findAll() throws DaoException;
}
