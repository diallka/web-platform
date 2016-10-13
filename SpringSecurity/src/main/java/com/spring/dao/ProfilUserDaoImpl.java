package com.spring.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.spring.model.ProfilUser;

@Repository("userProfileDao")
public class ProfilUserDaoImpl extends AbstractDao<Integer, ProfilUser>implements ProfilUserDao{

	@SuppressWarnings("unchecked")
	public List<ProfilUser> findAll(){
		Criteria crit = createEntityCriteria();
		crit.addOrder(Order.asc("type"));
		return (List<ProfilUser>)crit.list();
	}
	
	public ProfilUser findById(int id) {
		return getByKey(id);
	}
	
	public ProfilUser findByType(String type) {
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("type", type));
		return (ProfilUser) crit.uniqueResult();
	}
}
